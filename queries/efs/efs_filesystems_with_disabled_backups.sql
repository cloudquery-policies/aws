SELECT account_id, arn
FROM aws_efs_filesystems
WHERE backup_policy_status IS DISTINCT FROM 'ENABLED'
