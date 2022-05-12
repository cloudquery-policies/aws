SELECT account_id, region, id, arn, 'update subnet settings so that public IP addresses are not automatically assigned' as cq_reason
FROM aws_ec2_subnets
WHERE map_public_ip_on_launch IS TRUE;
