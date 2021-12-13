(
  SELECT db_cluster_arn
  FROM aws_rds_clusters
  WHERE
    (engine IN ('aurora', 'aurora-mysql', 'mysql') AND port = 3306)
    OR (engine LIKE '%postgres%' AND port = '5432')
)
UNION
(
  SELECT arn
  FROM aws_rds_instances
  WHERE
    (engine IN ('aurora', 'aurora-mysql', 'mariadb', 'mysql') AND instance_port = 3306)
    OR (engine LIKE '%postgres%' AND instance_port = '5432')
    OR (engine LIKE '%oracle%' AND instance_port = '1521')
    OR (engine LIKE '%sqlserver%' AND instance_port = '1433')
)
