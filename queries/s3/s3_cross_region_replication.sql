SELECT
    aws_s3_buckets.account_id,
    aws_s3_buckets.arn,
    aws_s3_buckets.region
FROM
    aws_s3_buckets
WHERE
    aws_s3_buckets.cq_id NOT IN (
        SELECT
            bucket_cq_id
        FROM
            aws_s3_bucket_replication_rules
        WHERE
            aws_s3_bucket_replication_rules.status IS NULL
            OR aws_s3_bucket_replication_rules.status != 'Enabled'
    );

-- Note: This query doesn't validate that the destination bucket is actually in a different region
