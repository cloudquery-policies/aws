SELECT account_id,
       id,
       region
FROM aws_redshift_clusters
WHERE
    automated_snapshot_retention_period < 7
    OR automated_snapshot_retention_period IS NULL;
