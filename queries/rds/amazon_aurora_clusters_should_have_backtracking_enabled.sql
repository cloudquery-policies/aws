SELECT db_cluster_arn
FROM aws_rds_clusters
WHERE
    engine IN ('aurora', 'aurora-mysql', 'mysql')
    AND backtrack_window IS NULL
