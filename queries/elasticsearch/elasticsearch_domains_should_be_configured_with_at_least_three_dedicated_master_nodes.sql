SELECT account_id, region, arn
FROM aws_elasticsearch_domains
WHERE
  cluster_dedicated_master_enabled IS NOT TRUE
  OR cluster_dedicated_master_count IS NULL
  OR cluster_dedicated_master_count < 3
