SELECT account_id, region, arn, 'cluster should be in a VPC' as cq_reason
FROM aws_elasticsearch_domains
WHERE vpc_vpc_id IS NULL
