select
    aws_s3_buckets.arn
from
    aws_s3_buckets -- Find and join all bucket ACLS that givea public write access
    left join aws_s3_bucket_grants on aws_s3_buckets.cq_id = aws_s3_bucket_grants.bucket_cq_id 
    -- Find all statements that could give public allow access 
    -- Statements that give public access have 1) Effect == Allow 2) One of the following principal:
    --       Principal = {"AWS": "*"}
    --       Principal = {"AWS": ["arn:aws:iam::12345678910:root", "*"]}
    --       Principal = "*"
    left join (
        select
            arn,
            count(*) as statement_count
        from
            (
                select
                    aws_s3_buckets.arn,
                    statements -> 'Principal' as principals
                from
                    aws_s3_buckets,
                    jsonb_array_elements(policy -> 'Statement') as statements
                where
                    statements -> 'Effect' = '"Allow"'
            ) as foo        
        where
            principals = '"*"'
            or (
                principals :: jsonb ? 'AWS'
                and (
                    principals -> 'AWS' = '"*"'
                    or principals -> 'AWS' @> '"*"'
                )
            )
        group by
            arn
    ) as policy_allow_public on aws_s3_buckets.cq_id = aws_s3_bucket_grants.bucket_cq_id
where
    (
        aws_s3_buckets.block_public_acls != true
        and (
            uri = 'http://acs.amazonaws.com/groups/global/AllUsers'
            and permission in ('WRITE_ACP', 'FULL_CONTROL')
        )
    )
    OR (
        aws_s3_buckets.block_public_policy != true
        and policy_allow_public.statement_count > 0
    );