SELECT 
    account_id, 
    region, 
    public_ip,
    'Security Hub recommends that you release this elastic IP address' as cq_reason
FROM aws_ec2_eips
WHERE instance_id IS NULL
