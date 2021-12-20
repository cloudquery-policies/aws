SELECT account_id,
       region,
       arn,
       name
FROM aws_secretsmanager_secrets
WHERE last_rotated_date IS NULL
  AND created_date > now() - INTERVAL '1 day' * rotation_rules_automatically_after_days
   OR last_rotated_date IS NOT NULL
  AND
    last_rotated_date
    > now() - INTERVAL '1 day' * rotation_rules_automatically_after_days;
