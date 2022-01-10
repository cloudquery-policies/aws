SELECT account_id,
       region,
       arn
FROM aws_sns_topics
WHERE kms_master_key_id IS NULL
      OR kms_master_key_id = '';
