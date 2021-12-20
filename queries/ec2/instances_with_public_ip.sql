SELECT account_id, region, id
FROM aws_ec2_instances
WHERE public_ip_address IS NOT NULL