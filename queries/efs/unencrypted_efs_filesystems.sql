SELECT account_id, arn, 'data should be encrypted' as cq_reason
FROM aws_efs_filesystems
WHERE encrypted IS DISTINCT FROM TRUE
    OR kms_key_id IS NULL;
