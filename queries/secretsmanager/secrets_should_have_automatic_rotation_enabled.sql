SELECT account_id,
       region,
       arn,
       name,
       'secrets should have automatic rotation enabled' as cq_reason
FROM aws_secretsmanager_secrets
WHERE rotation_enabled IS DISTINCT FROM TRUE;
