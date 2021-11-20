SELECT aws_cloudtrail_trails.account_id, s3_bucket_name, aws_cloudtrail_trails.arn from aws_cloudtrail_trails
JOIN aws_s3_buckets on s3_bucket_name = aws_s3_buckets.name
WHERE logging_target_bucket is NULL OR logging_target_prefix is NULL