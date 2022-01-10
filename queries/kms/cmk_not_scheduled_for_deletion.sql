SELECT arn,
       region,
       account_id
FROM aws_kms_keys
WHERE key_state = 'PendingDeletion'
      AND manager = 'CUSTOMER';
