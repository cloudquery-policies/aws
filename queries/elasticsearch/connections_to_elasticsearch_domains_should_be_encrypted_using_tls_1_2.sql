SELECT account_id, region, arn
FROM aws_elasticsearch_domains
WHERE
    domain_endpoint_tls_security_policy IS DISTINCT FROM 'Policy-Min-TLS-1-2-2019-07'
