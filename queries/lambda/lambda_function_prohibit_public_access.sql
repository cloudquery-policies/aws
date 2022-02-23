SELECT account_id,
       region,
       arn
FROM aws_lambda_functions,
    jsonb_array_elements(
        CASE JSONB_TYPEOF(policy_document -> 'Statement')
            WHEN 'string' THEN JSONB_BUILD_ARRAY(policy_document ->> 'Statement')
            WHEN 'array' THEN policy_document -> 'Statement'
        END
    ) AS statement
WHERE statement ->> 'Effect' = 'Allow'
    AND (
        statement ->> 'Principal' = '*'
        OR statement -> 'Principal' ->> 'AWS' = '*'
        OR (statement -> 'Principal' ->> 'AWS')::JSONB ? '*'
    );
