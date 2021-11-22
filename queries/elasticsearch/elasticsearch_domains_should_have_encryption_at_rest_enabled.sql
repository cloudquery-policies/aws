SELECT account_id, region, arn
FROM aws_elasticsearch_domains
WHERE encryption_at_rest_enabled IS DISTINCT FROM TRUE
