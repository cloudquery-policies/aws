WITH policy_statements AS (
    SELECT
        p.cq_id AS cq_id,
        JSONB_ARRAY_ELEMENTS(
            CASE JSONB_TYPEOF(v.document -> 'Statement')
                WHEN 'string' THEN JSONB_BUILD_ARRAY(v.document ->> 'Statement')
                WHEN 'array' THEN v.document -> 'Statement'
            END
        ) AS statement
    FROM
        aws_iam_policies p
        LEFT JOIN aws_iam_policy_versions v
            ON p.cq_id = v.policy_cq_id AND p.default_version_id = v.version_id
    WHERE p.arn NOT LIKE 'arn:aws:iam::aws:policy%'
),
allow_all_statements AS (
    SELECT cq_id, COUNT(statement) AS statements_count
    FROM
        policy_statements
    WHERE
        statement ->> 'Effect' = 'Allow'
        AND (
            statement ->> 'Action' LIKE '%*%'
            OR statement ->> 'NotAction' LIKE '%*%')
    GROUP BY
        cq_id
)
SELECT p.account_id, p.name, p.arn,  format('policy %s has wildcard "*" statements', arn) as cq_reason
FROM aws_iam_policies p
     LEFT JOIN allow_all_statements s ON p.cq_id = s.cq_id
WHERE statements_count > 0;
