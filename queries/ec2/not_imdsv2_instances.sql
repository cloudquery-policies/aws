SELECT account_id, region, id
FROM aws_ec2_instances
WHERE metadata_options_http_tokens IS DISTINCT FROM 'required';