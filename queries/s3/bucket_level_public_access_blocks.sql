SELECT arn, region
FROM aws_s3_buckets
WHERE block_public_acls IS NOT TRUE
    OR block_public_policy IS NOT TRUE
    OR ignore_public_acls IS NOT TRUE
    OR restrict_public_buckets IS NOT TRUE
