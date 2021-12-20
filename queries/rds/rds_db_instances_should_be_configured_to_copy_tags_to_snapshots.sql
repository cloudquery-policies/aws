SELECT arn
FROM aws_rds_instances
WHERE copy_tags_to_snapshot IS NOT TRUE
