SELECT account_id,
       region,
       arn,
       name
FROM aws_secretsmanager_secrets
WHERE rotation_enabled IS DISTINCT FROM TRUE;
