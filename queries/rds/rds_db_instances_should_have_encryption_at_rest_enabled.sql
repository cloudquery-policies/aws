SELECT arn
FROM aws_rds_instances
WHERE storage_encrypted IS NOT TRUE
