SELECT account_id,
       region,
       arn,
       name
FROM aws_secretsmanager_secrets
WHERE (last_accessed_date IS NULL AND created_date > NOW() - INTERVAL '90 days')
       OR (last_accessed_date IS NOT NULL AND last_accessed_date > NOW() - INTERVAL '90 days');
