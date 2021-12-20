select arn,
       region,
       account_id
from aws_kms_keys
where key_state = 'PendingDeletion'
  and manager = 'CUSTOMER';
