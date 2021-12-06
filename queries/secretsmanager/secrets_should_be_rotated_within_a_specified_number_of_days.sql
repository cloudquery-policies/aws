SELECT account_id,
       region,
       arn,
       name
FROM aws_secretsmanager_secrets
WHERE last_rotated_date IS NULL AND
      (date ( current_date) - date (created_date)) > 90
   OR last_rotated_date IS NOT NULL AND
      (date ( current_date) - date (last_rotated_date)) > 90;
