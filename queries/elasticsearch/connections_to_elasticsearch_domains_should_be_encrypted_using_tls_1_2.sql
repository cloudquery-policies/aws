SELECT 
    account_id, 
    region, 
    arn,
    'TLS security policies should not use older versions' as cq_reason

FROM aws_elasticsearch_domains
WHERE
    domain_endpoint_tls_security_policy IS DISTINCT FROM 'Policy-Min-TLS-1-2-2019-07'
