SELECT arn,
       account_id,
       format('inline policy %s blocks kms actions', policy_name) as cq_reason
FROM
    (
        -- select all user policies
        SELECT statement,
            aws_iam_users.account_id,
            arn,
            policy_name,
            aws_iam_users.cq_id
        FROM aws_iam_user_policies
            CROSS JOIN LATERAL jsonb_array_elements(
                CASE JSONB_TYPEOF(policy_document -> 'Statement')
                    WHEN 'string' THEN JSONB_BUILD_ARRAY(policy_document ->> 'Statement')
                    WHEN 'array' THEN policy_document -> 'Statement' END
                ) AS statement
            JOIN aws_iam_users ON aws_iam_users.cq_id = aws_iam_user_policies.user_cq_id
        UNION
        -- select all role policies
        SELECT statement,
            aws_iam_roles.account_id,
            arn,
            policy_name,
            aws_iam_roles.cq_id
        FROM aws_iam_role_policies
             CROSS JOIN LATERAL jsonb_array_elements(
                CASE JSONB_TYPEOF(policy_document -> 'Statement')
                    WHEN 'string' THEN JSONB_BUILD_ARRAY(policy_document ->> 'Statement')
                    WHEN 'array' THEN policy_document -> 'Statement' END
                ) AS statement
            JOIN aws_iam_roles ON aws_iam_roles.cq_id = aws_iam_role_policies.role_cq_id
        WHERE LOWER(arn) NOT LIKE 'arn:aws:iam::%:role/aws-service-role/%'
        UNION
        -- select all group policies
        SELECT statement,
            aws_iam_groups.account_id,
            arn,
            policy_name,
            aws_iam_groups.cq_id
        FROM aws_iam_group_policies
            CROSS JOIN LATERAL jsonb_array_elements(
                CASE JSONB_TYPEOF(policy_document -> 'Statement')
                    WHEN 'string' THEN JSONB_BUILD_ARRAY(policy_document ->> 'Statement')
                    WHEN 'array' THEN policy_document -> 'Statement' END
                ) AS statement
            JOIN aws_iam_groups ON aws_iam_groups.cq_id = aws_iam_group_policies.group_cq_id) T
WHERE
    statement ->> 'Effect' = 'Allow'
    AND LOWER(statement::TEXT)::JSONB -> 'resource' ?| ARRAY[
        '*',
        'arn:aws:kms:*:*:key/*',
        'arn:aws:kms:*:' || account_id || ':key/*'
        'arn:aws:kms:*:*:alias/*',
        'arn:aws:kms:*:' || account_id || ':alias/*'
    ]

    AND LOWER(statement::TEXT)::JSONB -> 'action' ?| ARRAY[
        '*',
        'kms:*',
        'kms:decrypt',
        'kms:encrypt*',
        'kms:reencryptfrom'
    ]
