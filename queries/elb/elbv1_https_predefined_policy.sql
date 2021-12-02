select lb.account_id, lb.region, lb.name from aws_elbv1_load_balancers lb
join aws_elbv1_load_balancer_listeners ls on ls.load_balancer_cq_id=lb.cq_id
where ls.listener_protocol in ('HTTPS', 'SSL') and 'ELBSecurityPolicy-TLS-1-2-2017-01' != any(lb.other_policies);
