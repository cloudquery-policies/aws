SELECT
    aws_cloudtrail_trails.account_id, region, arn, 'log file validation should be enabled' as cq_reason
FROM aws_cloudtrail_trails
WHERE log_file_validation_enabled = FALSE
