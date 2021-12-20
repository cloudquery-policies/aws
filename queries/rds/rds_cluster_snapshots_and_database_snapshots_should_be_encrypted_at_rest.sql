(
  SELECT arn
  FROM aws_rds_cluster_snapshots
  WHERE storage_encrypted IS NOT TRUE
)
UNION
(
  SELECT arn
  FROM aws_rds_db_snapshots
  WHERE encrypted IS NOT TRUE
)
