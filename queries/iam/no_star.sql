WITH violations AS (
    SELECT policy_cq_id,
           COUNT(*) AS violations
    FROM aws_iam_policy_versions,
        JSONB_ARRAY_ELEMENTS(document -> 'Statement') AS statement,
        JSONB_ARRAY_ELEMENTS_TEXT(
            CASE JSONB_TYPEOF(statement -> 'Resource')
                WHEN 'string' THEN JSONB_BUILD_ARRAY(statement ->> 'Resource')
                WHEN 'array' THEN statement -> 'Resource' END
        ) AS resource,
        JSONB_ARRAY_ELEMENTS_TEXT( CASE JSONB_TYPEOF(statement -> 'Action')
                WHEN 'string' THEN JSONB_BUILD_ARRAY(statement ->> 'Action')
                WHEN 'array' THEN statement -> 'Action' END
        ) AS action
    WHERE statement ->> 'Effect' = 'Allow'
          AND resource = '*'
          AND ( action = '*' OR action = '*:*' )
    GROUP BY policy_cq_id
)
SELECT account_id,
       arn,
       id,
       name,
       violations
FROM aws_iam_policies
     JOIN violations ON violations.policy_cq_id = aws_iam_policies.cq_id
