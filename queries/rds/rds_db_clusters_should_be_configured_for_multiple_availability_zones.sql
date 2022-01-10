SELECT db_cluster_arn
FROM aws_rds_clusters
WHERE multi_az IS NOT TRUE
