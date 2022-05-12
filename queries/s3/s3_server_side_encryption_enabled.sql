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
            aws_s3_bucket_encryption_rules
    );

-- Note: This query doesn't validate if a bucket policy requires encryption for `put-object` requests
