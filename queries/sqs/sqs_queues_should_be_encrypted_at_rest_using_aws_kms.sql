SELECT account_id,
       region,
       arn,
       'SNS queues should be encrypted at rest using kms' as cq_reason
FROM aws_sqs_queues
WHERE kms_master_key_id IS NULL
      OR kms_master_key_id = '';
