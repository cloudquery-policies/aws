SELECT db_cluster_arn
FROM aws_rds_clusters
WHERE deletion_protection IS NOT TRUE
