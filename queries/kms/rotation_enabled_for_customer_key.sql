select account_id,
       region,
       arn
from aws_kms_keys
where rotation_enabled is false
  and manager = 'CUSTOMER';
