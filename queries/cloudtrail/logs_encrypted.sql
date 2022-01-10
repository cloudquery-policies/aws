SELECT
    account_id,
    region,
    arn,
    kms_key_id
FROM
    aws_cloudtrail_trails
WHERE
    kms_key_id IS NULL
