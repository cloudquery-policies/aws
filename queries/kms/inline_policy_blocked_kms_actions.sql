WITH iam_users AS (
    SELECT policy_document,
        aws_iam_users.account_id,
        arn,
        aws_iam_users.cq_id
    FROM aws_iam_user_policies
        JOIN aws_iam_users ON aws_iam_users.cq_id = aws_iam_user_policies.user_cq_id
),
iam_user_violations AS (
    SELECT DISTINCT cq_id
    FROM iam_users,
        jsonb_array_elements(policy_document -> 'Statement') AS statement
    WHERE
        statement ->> 'Effect' = 'Allow'
        AND statement -> 'Resource' ?| array['*', 'arn:aws:kms:*:' || account_id || ':key/*', 'arn:aws:kms:*:' || account_id || ':alias/*'] --noqa
        AND statement -> 'Action' ?| array['*', 'kms:*', 'kms:decrypt', 'kms:deencrypt*', 'kms:reencryptfrom']
),
iam_roles AS (
    SELECT policy_document,
        aws_iam_roles.account_id,
        arn,
        aws_iam_roles.cq_id
    FROM aws_iam_role_policies
        JOIN aws_iam_roles ON aws_iam_roles.cq_id = aws_iam_role_policies.role_cq_id
),
iam_role_violations AS (
    SELECT DISTINCT cq_id
    FROM iam_roles,
        jsonb_array_elements(policy_document -> 'Statement') AS statement
    WHERE
        statement ->> 'Effect' = 'Allow'
        AND statement -> 'Resource' ?| array['*', 'arn:aws:kms:*:' || account_id || ':key/*', 'arn:aws:kms:*:' || account_id || ':alias/*'] --noqa
        AND statement -> 'Action' ?| array['*', 'kms:*', 'kms:decrypt', 'kms:deencrypt*', 'kms:reencryptfrom']
),
iam_groups AS (
    SELECT policy_document,
        aws_iam_groups.account_id,
        arn,
        aws_iam_groups.cq_id
    FROM aws_iam_group_policies
        JOIN aws_iam_groups ON aws_iam_groups.cq_id = aws_iam_group_policies.group_cq_id
),
iam_group_violations AS (
    SELECT DISTINCT cq_id
    FROM iam_groups,
        jsonb_array_elements(policy_document -> 'Statement') AS statement
    WHERE
        statement ->> 'Effect' = 'Allow'
        AND statement -> 'Resource' ?| array['*', 'arn:aws:kms:*:' || account_id || ':key/*', 'arn:aws:kms:*:' || account_id || ':alias/*'] --noqa
        AND statement -> 'Action' ?| array['*', 'kms:*', 'kms:decrypt', 'kms:deencrypt*', 'kms:reencryptfrom']
)
SELECT arn,
       account_id
FROM aws_iam_users
     JOIN iam_user_violations ON iam_user_violations.cq_id = aws_iam_users.cq_id
UNION
SELECT arn,
       account_id
FROM aws_iam_roles
     JOIN iam_role_violations ON iam_role_violations.cq_id = aws_iam_roles.cq_id
WHERE arn NOT LIKE 'arn:aws:iam::%:role/aws-service-role/%'
UNION
SELECT arn,
       account_id
FROM aws_iam_groups
     JOIN iam_group_violations ON iam_group_violations.cq_id = aws_iam_groups.cq_id;
