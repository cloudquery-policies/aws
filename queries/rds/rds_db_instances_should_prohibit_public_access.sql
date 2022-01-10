SELECT account_id, region, arn
FROM aws_rds_instances
WHERE publicly_accessible IS TRUE
