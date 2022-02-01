SELECT arn
FROM aws_rds_clusters
WHERE iam_database_authentication_enabled IS NOT TRUE
