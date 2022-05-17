SELECT account_id, region, id, 'instance should have IMDSv2 enabled' as cq_reason
FROM aws_ec2_instances
WHERE metadata_options_http_tokens IS DISTINCT FROM 'required';
