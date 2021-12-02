with iam_policies as
         (select document,
                 account_id,
                 arn,
                 aws_iam_policies.cq_id
          from aws_iam_policy_versions
                   join aws_iam_policies on aws_iam_policies.cq_id = aws_iam_policy_versions.policy_cq_id),
     violations as
         (select distinct cq_id
          from iam_policies,
               jsonb_array_elements(document -> 'Statement') as statement
          where not (arn like 'arn:aws:iam::aws:policy%'
              or arn like 'arn:aws-us-gov:iam::aws:policy%')
            and statement ->> 'Effect' = 'Allow'
            and statement -> 'Resource'?| array['*',
                      'arn:aws:kms:*:' || account_id || ':key/*',
                      'arn:aws:kms:*:' || account_id || ':alias/*']
            and statement -> 'Action' ?| array['*',
              'kms:*',
              'kms:decrypt',
              'kms:reencryptfrom',
              'kms:reencrypt*'] )
select arn,
       account_id
from aws_iam_policies
         join violations on violations.cq_id = aws_iam_policies.cq_id;
