SELECT account_id,
       region,
       arn,
       name
FROM aws_secretsmanager_secrets
WHERE last_rotated_date IS NULL AND created_date > now() - INTERVAL '90 days'
   OR last_rotated_date IS NOT NULL AND last_rotated_date > now() - INTERVAL '90 days';
