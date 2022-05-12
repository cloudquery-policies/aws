SELECT
    account_id,
    region,
    arn,
    kms_key_id,
    'cloudtrail logs should be encrypted with a kms key' as cq_reason
FROM
    aws_cloudtrail_trails
WHERE
    kms_key_id IS NULL
