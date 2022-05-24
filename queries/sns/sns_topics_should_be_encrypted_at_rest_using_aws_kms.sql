SELECT account_id,
       region,
       arn,
       format('SNS topic %s should be encrypted at rest using kms', display_name) as cq_reason
FROM aws_sns_topics
WHERE kms_master_key_id IS NULL
      OR kms_master_key_id = '';
