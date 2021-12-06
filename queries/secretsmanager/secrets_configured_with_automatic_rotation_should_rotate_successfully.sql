SELECT account_id,
       region,
       arn,
       name
FROM aws_secretsmanager_secrets
WHERE last_rotated_date IS NULL AND
      (date ( current_date) - date (created_date)) > rotation_rules_automatically_after_days
   OR last_rotated_date IS NOT NULL AND
      (date ( current_date) - date (last_rotated_date)) > rotation_rules_automatically_after_days;
