SELECT t.account_id, t.region, t.id, t.name, t.arn FROM aws_dynamodb_tables t
LEFT JOIN aws_dynamodb_table_continuous_backups b ON b.table_cq_id=t.cq_id
WHERE b.point_in_time_recovery_status IS DISTINCT FROM 'ENABLED'