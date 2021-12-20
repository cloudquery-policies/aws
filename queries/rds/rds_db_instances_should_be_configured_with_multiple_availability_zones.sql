SELECT arn
FROM aws_rds_instances
WHERE multi_az IS NOT TRUE
