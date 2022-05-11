(SELECT 
    lb.account_id, 
    lb.region, 
    lb.name,
    'ALB should store access logs in S3' as cq_reason
    FROM aws_elbv2_load_balancers lb
    JOIN
        aws_elbv2_load_balancer_attributes a ON a.load_balancer_cq_id = lb.cq_id
    WHERE lb.type = 'application' AND a.access_logs_s3_enabled IS NOT TRUE)
UNION
(
    SELECT
        account_id, region, name,
        'ALB have access logs enabled' as cq_reason
    FROM
        aws_elbv1_load_balancers
    WHERE attributes_access_log_enabled IS NOT TRUE
);
