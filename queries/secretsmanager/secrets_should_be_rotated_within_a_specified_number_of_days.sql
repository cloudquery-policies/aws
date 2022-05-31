SELECT account_id,
       region,
       arn,
       name,
       format('secret was last rotated %s days', COALESCE(DATE_PART('days', NOW() - last_rotated_date), DATE_PART('days', NOW() - created_date))) as cq_reason
FROM aws_secretsmanager_secrets
WHERE (last_rotated_date IS NULL AND created_date > NOW() - INTERVAL '90 days')
       OR (last_rotated_date IS NOT NULL AND last_rotated_date > NOW() - INTERVAL '90 days');
