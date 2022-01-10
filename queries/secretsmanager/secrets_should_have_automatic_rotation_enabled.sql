SELECT account_id,
       region,
       arn,
       name
FROM aws_secretsmanager_secrets
WHERE rotation_enabled IS FALSE
    AND rotation_enabled IS NULL;
