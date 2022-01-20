SELECT account_id, region, id, name
FROM aws_efs_filesystems
WHERE encrypted IS DISTINCT FROM TRUE
   OR kms_key_id = NULL;