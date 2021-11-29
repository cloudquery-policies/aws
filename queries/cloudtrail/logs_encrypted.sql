SELECT
    account_id,
    region,
    arn,
    kms_key_id
from
    aws_cloudtrail_trails
WHERE
    kms_key_id is NULL