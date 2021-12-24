SELECT account_id, region, id, arn
FROM aws_ec2_subnets
WHERE map_public_ip_on_launch IS TRUE;