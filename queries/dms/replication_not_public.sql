SELECT
    account_id, region, arn, publicly_accessible, 'disable publicly accessible endpoint by deleting instance and recreating' as cq_reason
FROM aws_dms_replication_instances
WHERE publicly_accessible IS TRUE
