SELECT 
    account_id, 
    region, 
    id,
    'ensure EC2 instances is not in a subnet or VPC that automatically assigns public IP addresses' as cq_reason
FROM aws_ec2_instances
WHERE public_ip_address IS NOT NULL
