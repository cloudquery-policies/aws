SELECT account_id, region, arn,
CASE
    WHEN  cluster_dedicated_master_enabled IS NOT TRUE THEN 'cluster should have dedicated master node enabled'
    WHEN  cluster_dedicated_master_count IS NULL THEN 'cluster should have at least 3 master nodes'
    WHEN  cluster_dedicated_master_count < 3 THEN 'cluster should have at least 3 master nodes'
END as cq_reason

FROM aws_elasticsearch_domains
WHERE
    cluster_dedicated_master_enabled IS NOT TRUE
    OR cluster_dedicated_master_count IS NULL
    OR cluster_dedicated_master_count < 3
