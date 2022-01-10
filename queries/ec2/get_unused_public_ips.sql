SELECT account_id, region, public_ip
FROM aws_ec2_eips
WHERE instance_id IS NULL
