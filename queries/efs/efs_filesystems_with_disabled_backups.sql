SELECT account_id, arn,
'EFS should have a backup policy specified' as cq_reason
FROM aws_efs_filesystems
WHERE backup_policy_status IS DISTINCT FROM 'ENABLED'
