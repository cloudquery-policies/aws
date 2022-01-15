SELECT account_id,
       region,
       arn
FROM aws_lambda_functions,
    jsonb_array_elements(policy_document -> 'Statement') AS statment
WHERE statment ->> 'Effect' = 'Allow'
    AND (
        statment ->> 'Principal' = '*'
        OR statment -> 'Principal' ->> 'AWS' = '*'
        OR (statment -> 'Principal' ->> 'AWS')::JSONB ? '*'
    );
