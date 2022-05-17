SELECT
    lb.account_id, lb.region, lb.name, ls.listener_protocol,
    'listeners should only support TLS and HTTPS' as cq_reason
FROM aws_elbv1_load_balancers lb
    JOIN
        aws_elbv1_load_balancer_listeners ls ON
            ls.load_balancer_cq_id = lb.cq_id
WHERE ls.listener_protocol NOT IN ('HTTPS', 'SSL');
