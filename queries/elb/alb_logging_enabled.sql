(select lb.account_id, lb.region, lb.name from aws_elbv2_load_balancers lb
join aws_elbv2_load_balancer_attributes a on a.load_balancer_cq_id=lb.cq_id
where lb.type='application' and a.access_logs_s3_enabled is not true)
union
(select account_id, region, name from aws_elbv1_load_balancers where attributes_access_log_enabled is not true);
