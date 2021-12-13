SELECT arn
FROM aws_rds_instances
WHERE iam_database_authentication_enabled IS NOT TRUE
