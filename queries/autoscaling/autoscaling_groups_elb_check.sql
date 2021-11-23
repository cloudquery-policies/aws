SELECT "account_id", "region", "name"
FROM aws_autoscaling_groups
WHERE array_length("load_balancer_names", 1) > 0
AND "health_check_type" != 'ELB'