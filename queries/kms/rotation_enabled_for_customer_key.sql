SELECT account_id,
       region,
       arn,
       format('KMS key %s has no rotation enabled', id) as cq_reason
FROM aws_kms_keys
WHERE rotation_enabled IS FALSE
      AND manager = 'CUSTOMER';
