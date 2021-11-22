select
    aws_s3_buckets.arn
from
    aws_s3_buckets
where
    aws_s3_buckets.cq_id not in (
        select
            bucket_cq_id
        from
            aws_s3_bucket_replication_rules 
        where
            aws_s3_bucket_replication_rules.status is NULL
            or aws_s3_bucket_replication_rules.status != 'Enabled'
    );

-- Note: This query doesn't validate that the destination bucket is actually in a different region