SELECT arn
FROM aws_rds_instances
WHERE deletion_protection IS NOT TRUE
