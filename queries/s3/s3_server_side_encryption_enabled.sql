select
    aws_s3_buckets.arn
from
    aws_s3_buckets
where
    aws_s3_buckets.cq_id not in (
        select
            bucket_cq_id
        from
            aws_s3_bucket_encryption_rules 
    );

-- Note: This query doesn't validate if a bucket policy requires encryption for `put-object` requests