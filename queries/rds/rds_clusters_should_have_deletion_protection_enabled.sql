SELECT arn
FROM aws_rds_clusters
WHERE deletion_protection IS NOT TRUE
