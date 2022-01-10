SELECT
    aws_cloudtrail_trails.account_id, s3_bucket_name, aws_cloudtrail_trails.arn
FROM aws_cloudtrail_trails
    JOIN aws_s3_buckets ON s3_bucket_name = aws_s3_buckets.name
WHERE logging_target_bucket IS NULL OR logging_target_prefix IS NULL
