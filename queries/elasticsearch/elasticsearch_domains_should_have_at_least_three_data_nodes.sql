SELECT account_id, region, arn,
    CASE
        WHEN  NOT cluster_zone_awareness_enabled THEN 'cluster zone awareness should be enabled'
        WHEN  cluster_dedicated_master_count IS NULL THEN 'cluster should have at least 3 data nodes'
        WHEN  cluster_dedicated_master_count < 3 THEN 'cluster should have at least 3 data nodes'
    END as cq_reason
FROM aws_elasticsearch_domains
WHERE
    NOT cluster_zone_awareness_enabled
    OR cluster_instance_count IS NULL
    OR cluster_instance_count < 3
