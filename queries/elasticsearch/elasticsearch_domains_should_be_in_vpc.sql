SELECT account_id, region, arn
FROM aws_elasticsearch_domains
WHERE vpc_vpc_id IS NULL
