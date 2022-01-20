SELECT account_id, arn
FROM aws_efs_filesystems
WHERE encrypted IS DISTINCT FROM TRUE
    OR kms_key_id IS NULL;
