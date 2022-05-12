WITH iam_policies AS (
    SELECT document,
        account_id,
        arn,
        aws_iam_policies.cq_id
    FROM aws_iam_policy_versions
        JOIN aws_iam_policies ON aws_iam_policies.cq_id = aws_iam_policy_versions.policy_cq_id
),
violations AS (
    SELECT DISTINCT cq_id
    FROM iam_policies,
        jsonb_array_elements(
            CASE JSONB_TYPEOF(document -> 'Statement')
                WHEN 'string' THEN JSONB_BUILD_ARRAY(document ->> 'Statement')
                WHEN 'array' THEN document -> 'Statement'
            END
        ) AS statement
    WHERE
        NOT(arn LIKE 'arn:aws:iam::aws:policy%' OR arn LIKE 'arn:aws-us-gov:iam::aws:policy%')
        AND statement ->> 'Effect' = 'Allow'
        AND statement -> 'Resource'?| array['*', 'arn:aws:kms:*:' || account_id || ':key/*', 'arn:aws:kms:*:' || account_id || ':alias/*'] -- noqa
        AND statement -> 'Action' ?| array['*', 'kms:*', 'kms:decrypt', 'kms:reencryptfrom', 'kms:reencrypt*'] -- noqa
)
SELECT arn,
       account_id,
       format('policy %s blocks kms actions', name) as cq_reason
FROM aws_iam_policies
     JOIN violations ON violations.cq_id = aws_iam_policies.cq_id;
