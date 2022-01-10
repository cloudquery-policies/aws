SELECT
    account_id, region, arn, publicly_accessible
FROM aws_dms_replication_instances
WHERE publicly_accessible IS TRUE
