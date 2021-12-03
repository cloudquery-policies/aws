SELECT account_id, region, arn
FROM aws_elasticsearch_domains
WHERE
  NOT cluster_zone_awareness_enabled
  OR cluster_instance_count IS NULL
  OR cluster_instance_count < 3
