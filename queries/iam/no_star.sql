WITH violations AS (
    SELECT
        policy_cq_id,
        count(*) AS violations
    FROM
        aws_iam_policy_versions,
        jsonb_array_elements(document -> 'Statement') AS statement,
        jsonb_array_elements_text(
            CASE jsonb_typeof(
                statement -> 'Resource'
            )
                WHEN
                    'string' THEN jsonb_build_array(statement ->> 'Resource')
                WHEN 'array' THEN statement -> 'Resource'
            END
        ) AS resource,
        jsonb_array_elements_text(
            CASE jsonb_typeof(
                statement -> 'Action'
            )
                WHEN
                    'string' THEN jsonb_build_array(statement ->> 'Action')
                WHEN 'array' THEN statement -> 'Action'
            END
        ) AS action
    WHERE
        statement ->> 'Effect' = 'Allow'
        AND resource = '*'
        AND (
            action = '*'
            OR action = '*:*'
        )
    GROUP BY
        policy_cq_id
)
SELECT
    account_id,
    arn,
    id,
    name,
    violations
FROM
    aws_iam_policies
    JOIN violations ON violations.policy_cq_id = aws_iam_policies.cq_id
