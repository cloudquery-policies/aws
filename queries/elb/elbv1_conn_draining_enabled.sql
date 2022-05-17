SELECT
    account_id, region, name,
    'ALB should have connection draining enabled' as cq_reason
FROM
    aws_elbv1_load_balancers
WHERE attributes_connection_draining_enabled IS NOT TRUE;
