select lb.account_id, lb.region, lb.name from aws_elbv1_load_balancers lb
join aws_elbv1_load_balancer_listeners ls on ls.load_balancer_cq_id=lb.cq_id
left join aws_acm_certificates c on c.arn = ls.listener_ssl_certificate_id
where ls.listener_protocol='HTTPS' and c.arn IS NULL;
