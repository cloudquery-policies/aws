SELECT arn,
       region,
       account_id,
       'key is not scheduled for deletion' as cq_reason
FROM aws_kms_keys
WHERE key_state = 'PendingDeletion'
      AND manager = 'CUSTOMER';
