SELECT
    aws_ec2_vpcs.account_id, 
    aws_ec2_vpcs.region, 
    aws_ec2_vpcs.id, 
    aws_ec2_vpcs.arn,
    'enable VPC flow logging' as cq_reason
FROM aws_ec2_vpcs
    LEFT JOIN aws_ec2_flow_logs ON
        aws_ec2_vpcs.id = aws_ec2_flow_logs.resource_id
WHERE aws_ec2_flow_logs.resource_id IS NULL
