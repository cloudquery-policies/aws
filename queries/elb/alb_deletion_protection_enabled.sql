SELECT 
    lb.account_id, 
    lb.region, 
    lb.name,
    'ALB should have deletion protection enabled' as cq_reason
FROM aws_elbv2_load_balancers lb
    JOIN
        aws_elbv2_load_balancer_attributes a ON a.load_balancer_cq_id = lb.cq_id
WHERE lb.type = 'application' AND a.deletion_protection IS NOT TRUE;
