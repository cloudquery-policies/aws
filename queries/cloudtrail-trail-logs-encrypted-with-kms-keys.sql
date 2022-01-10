SELECT
    account_id, region, arn
FROM aws_cloudtrail_trails WHERE kms_key_id IS NULL
