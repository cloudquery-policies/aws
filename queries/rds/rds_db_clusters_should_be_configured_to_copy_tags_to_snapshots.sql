SELECT arn
FROM aws_rds_clusters
WHERE copy_tags_to_snapshot IS NOT TRUE
