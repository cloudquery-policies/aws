SELECT arn
FROM aws_rds_instances
WHERE subnet_group_vpc_id IS NULL
