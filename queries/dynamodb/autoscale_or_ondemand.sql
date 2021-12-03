SELECT t.account_id, t.region, t.id, t.name, t.arn FROM aws_dynamodb_tables t
LEFT JOIN aws_dynamodb_table_replica_auto_scalings s ON s.table_cq_id=t.cq_id
WHERE (t.billing_mode_summary->'billing_mode')::varchar IS DISTINCT FROM 'PAY_PER_REQUEST' AND (
  s.read_capacity->'auto_scaling_disabled' IS NULL OR (s.read_capacity->'auto_scaling_disabled') IS DISTINCT FROM 'false'
OR
  s.write_capacity->'auto_scaling_disabled' IS NULL OR (s.write_capacity->'auto_scaling_disabled') IS DISTINCT FROM 'false'
)