SELECT
    aws_s3_buckets.arn
FROM
    -- Find and join all bucket ACLS that givea public write access
    aws_s3_buckets
    LEFT JOIN
        aws_s3_bucket_grants ON
            aws_s3_buckets.cq_id = aws_s3_bucket_grants.bucket_cq_id
    -- Find all statements that could give public allow access 
    -- Statements that give public access have 1) Effect == Allow 2) One of the following principal:
    --       Principal = {"AWS": "*"}
    --       Principal = {"AWS": ["arn:aws:iam::12345678910:root", "*"]}
    --       Principal = "*"
    LEFT JOIN (
        SELECT
            arn,
            count(*) AS statement_count
        FROM
            (
                SELECT
                    aws_s3_buckets.arn,
                    statements -> 'Principal' AS principals
                FROM
                    aws_s3_buckets,
                    jsonb_array_elements(
                        CASE JSONB_TYPEOF(policy -> 'Statement')
                            WHEN 'string' THEN JSONB_BUILD_ARRAY(policy ->> 'Statement')
                            WHEN 'array' THEN policy -> 'Statement'
                        END
                    ) AS statements
                WHERE
                    statements -> 'Effect' = '"Allow"'
            ) AS foo
        WHERE
            principals = '"*"'
            OR (
                principals::JSONB ? 'AWS'
                AND (
                    principals -> 'AWS' = '"*"'
                    OR principals -> 'AWS' @> '"*"'
                )
            )
        GROUP BY
            arn
    ) AS policy_allow_public ON
        aws_s3_buckets.cq_id = aws_s3_bucket_grants.bucket_cq_id
WHERE
    (
        aws_s3_buckets.block_public_acls != TRUE
        AND (
            uri = 'http://acs.amazonaws.com/groups/global/AllUsers'
            AND permission IN ('WRITE_ACP', 'FULL_CONTROL')
        )
    )
    OR (
        aws_s3_buckets.block_public_policy != TRUE
        AND policy_allow_public.statement_count > 0
    );
