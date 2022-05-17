SELECT account_id, region, arn, 'data stored at rest should be encrypted' as cq_reason
FROM aws_elasticsearch_domains
WHERE encryption_at_rest_enabled IS NOT TRUE
