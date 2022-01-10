SELECT account_id,
       region,
       arn
FROM aws_kms_keys
WHERE rotation_enabled IS FALSE
      AND manager = 'CUSTOMER';
