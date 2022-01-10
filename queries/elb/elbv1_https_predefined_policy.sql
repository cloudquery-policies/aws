SELECT lb.account_id, lb.region, lb.name FROM aws_elbv1_load_balancers lb
    JOIN
        aws_elbv1_load_balancer_listeners ls ON
            ls.load_balancer_cq_id = lb.cq_id
WHERE
    ls.listener_protocol IN (
        'HTTPS', 'SSL'
    ) AND 'ELBSecurityPolicy-TLS-1-2-2017-01' != any(lb.other_policies)
;
