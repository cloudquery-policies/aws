SELECT
    aws_cloudtrail_trails.account_id, region, arn, log_file_validation_enabled
FROM aws_cloudtrail_trails
WHERE log_file_validation_enabled = FALSE
