select lb.account_id, lb.region, lb.name, ls.listener_protocol from aws_elbv1_load_balancers lb
join aws_elbv1_load_balancer_listeners ls on ls.load_balancer_cq_id=lb.cq_id
where ls.listener_protocol not in ('HTTPS', 'SSL');
