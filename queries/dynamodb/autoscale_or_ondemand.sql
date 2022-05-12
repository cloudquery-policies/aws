SELECT t.account_id,
       t.region,
       t.id,
       t.name,
       t.arn,
       pr.type,
       'table should have automatic scaling enabled via an autoscaling policy or have pay-per-request enabled' as cq_reason
FROM aws_dynamodb_tables t
    LEFT JOIN aws_dynamodb_table_replica_auto_scalings s ON s.table_cq_id = t.cq_id
    LEFT JOIN aws_applicationautoscaling_policies pr ON (pr.namespace = 'dynamodb'
        AND pr.resource_id = CONCAT('table/', t.name)
        AND pr.type = 'TargetTrackingScaling'
        AND pr.scalable_dimension = 'dynamodb:table:ReadCapacityUnits')
    LEFT JOIN aws_applicationautoscaling_policies pw ON (pw.namespace = 'dynamodb'
        AND pw.resource_id = CONCAT('table/', t.name)
        AND pw.type = 'TargetTrackingScaling'
        AND pw.scalable_dimension = 'dynamodb:table:WriteCapacityUnits')
WHERE (t.billing_mode_summary -> 'billing_mode')::VARCHAR IS DISTINCT
    FROM 'PAY_PER_REQUEST'
    AND (
        s.read_capacity -> 'auto_scaling_disabled' IS NULL
        OR (s.read_capacity -> 'auto_scaling_disabled') IS DISTINCT FROM 'false'
        OR s.write_capacity -> 'auto_scaling_disabled' IS NULL
        OR (s.write_capacity -> 'auto_scaling_disabled') IS DISTINCT
        FROM 'false'
    )
    AND (pr.cq_id IS NULL OR pw.cq_id IS NULL);
