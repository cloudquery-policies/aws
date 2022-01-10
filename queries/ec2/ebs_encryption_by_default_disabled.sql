SELECT account_id,
       region
FROM aws_ec2_regional_config
WHERE ebs_encryption_enabled_by_default IS DISTINCT FROM TRUE;
