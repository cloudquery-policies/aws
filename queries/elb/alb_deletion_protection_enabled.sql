select lb.account_id, lb.region, lb.name from aws_elbv2_load_balancers lb
join aws_elbv2_load_balancer_attributes a on a.load_balancer_cq_id=lb.cq_id
where lb.type='application' and a.deletion_protection is not true;
