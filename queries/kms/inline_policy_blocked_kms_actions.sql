with iam_users as
         (select policy_document,
                 aws_iam_users.account_id,
                 arn,
                 aws_iam_users.cq_id
          from aws_iam_user_policies
                   join aws_iam_users on aws_iam_users.cq_id = aws_iam_user_policies.user_cq_id),
     iam_user_violations as
         (select distinct cq_id
          from iam_users,
               jsonb_array_elements(policy_document -> 'Statement') as statement
          where statement ->> 'Effect' = 'Allow'
            and statement -> 'Resource' ?| array['*',
                      'arn:aws:kms:*:' || account_id || ':key/*',
                      'arn:aws:kms:*:' || account_id || ':alias/*']
            and statement -> 'Action' ?| array['*',
              'kms:*',
              'kms:decrypt',
              'kms:deencrypt*',
              'kms:reencryptfrom'] ),
     iam_roles as
         (select policy_document,
                 aws_iam_roles.account_id,
                 arn,
                 aws_iam_roles.cq_id
          from aws_iam_role_policies
                   join aws_iam_roles on aws_iam_roles.cq_id = aws_iam_role_policies.role_cq_id),
     iam_role_violations as
         (select distinct cq_id
          from iam_roles,
               jsonb_array_elements(policy_document -> 'Statement') as statement
          where statement ->> 'Effect' = 'Allow'
            and statement -> 'Resource' ?| array['*',
                      'arn:aws:kms:*:' || account_id || ':key/*',
                      'arn:aws:kms:*:' || account_id || ':alias/*']
            and statement -> 'Action' ?| array['*',
              'kms:*',
              'kms:decrypt',
              'kms:deencrypt*',
              'kms:reencryptfrom'] ),
     iam_groups as
         (select policy_document,
                 aws_iam_groups.account_id,
                 arn,
                 aws_iam_groups.cq_id
          from aws_iam_group_policies
                   join aws_iam_groups on aws_iam_groups.cq_id = aws_iam_group_policies.group_cq_id),
     iam_group_violations as
         (select distinct cq_id
          from iam_groups,
               jsonb_array_elements(policy_document -> 'Statement') as statement
          where statement ->> 'Effect' = 'Allow'
            and statement -> 'Resource' ?| array['*',
                      'arn:aws:kms:*:' || account_id || ':key/*',
                      'arn:aws:kms:*:' || account_id || ':alias/*']
            and statement -> 'Action' ?| array['*',
              'kms:*',
              'kms:decrypt',
              'kms:deencrypt*',
              'kms:reencryptfrom'] )
select arn,
       account_id
from aws_iam_users
         join iam_user_violations on iam_user_violations.cq_id = aws_iam_users.cq_id
union
select arn,
       account_id
from aws_iam_roles
         join iam_role_violations on iam_role_violations.cq_id = aws_iam_roles.cq_id
where arn not like 'arn:aws:iam::%:role/aws-service-role/%'
union
select arn,
       account_id
from aws_iam_groups
         join iam_group_violations on iam_group_violations.cq_id = aws_iam_groups.cq_id;
