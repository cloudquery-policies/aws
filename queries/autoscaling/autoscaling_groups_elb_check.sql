SELECT account_id, region, arn, name
FROM aws_autoscaling_groups
WHERE ARRAY_LENGTH(load_balancer_names, 1) > 0
  AND health_check_type IS DISTINCT FROM 'ELB';
