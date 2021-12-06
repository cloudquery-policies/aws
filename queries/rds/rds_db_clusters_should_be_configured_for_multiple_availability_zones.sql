SELECT arn
FROM aws_rds_clusters
WHERE multi_az IS NOT TRUE
