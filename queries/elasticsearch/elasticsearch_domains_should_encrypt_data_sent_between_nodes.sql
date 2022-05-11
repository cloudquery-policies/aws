SELECT account_id, region, arn, 'node to node communication should be encrypted' as cq_reason
FROM aws_elasticsearch_domains
WHERE node_to_node_encryption_enabled IS NOT TRUE
