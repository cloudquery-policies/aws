SELECT arn
FROM aws_rds_instances
WHERE auto_minor_version_upgrade IS NOT TRUE
