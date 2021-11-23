SELECT account_id, region, arn, publicly_accessible from aws_dms_replication_instances
WHERE publicly_accessible is true
