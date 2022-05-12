SELECT account_id,
       region,
    'the EBS encryption should be enabled by default' as cq_reason
FROM aws_ec2_regional_config
WHERE ebs_encryption_enabled_by_default IS DISTINCT FROM TRUE;
