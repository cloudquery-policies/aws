SELECT 
    lb.account_id, 
    lb.region, 
    lb.name,
    'ALB should use certificate from ACM' as cq_reason
    FROM aws_elbv1_load_balancers lb
    JOIN
        aws_elbv1_load_balancer_listeners ls ON
            ls.load_balancer_cq_id = lb.cq_id
    LEFT JOIN aws_acm_certificates c ON c.arn = ls.listener_ssl_certificate_id
WHERE ls.listener_protocol = 'HTTPS' AND c.arn IS NULL;
