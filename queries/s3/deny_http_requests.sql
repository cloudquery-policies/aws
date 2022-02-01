SELECT
    arn
FROM
    aws_s3_buckets
WHERE
    arn NOT IN (
        -- Find all buckets that have a bucket policy that denies non SSL requests
        SELECT
            arn
        FROM
            (
                SELECT
                    aws_s3_buckets.arn,
                    statements -> 'Principal' AS principals,
                    statements
                FROM
                    aws_s3_buckets,
                    jsonb_array_elements(policy -> 'Statement') AS statements
                WHERE
                    statements -> 'Effect' = '"Deny"'
            ) AS foo,
            jsonb_array_elements_text(
                statements -> 'Condition' -> 'Bool' -> 'aws:securetransport'
            ) AS ssl
        WHERE
            principals = '"*"'
            OR (
                principals::JSONB ? 'AWS'
                AND (
                    principals -> 'AWS' = '"*"'
                    OR principals -> 'AWS' @> '"*"'
                )
            )
            AND ssl::BOOL = FALSE
    );
