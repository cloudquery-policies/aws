SELECT arn,
	account_id,
	a.value::text AS action,
	p.value::text AS user
FROM
	(SELECT aws_s3_buckets.arn,
			account_id,
            -- For each Statement return an array containing the prinicipals
			CASE
				WHEN JSONB_TYPEOF(statements -> 'Principal') = 'string' THEN JSONB_BUILD_ARRAY(statements -> 'Principal')
				WHEN JSONB_TYPEOF(statements -> 'Principal' -> 'AWS') = 'string' THEN JSONB_BUILD_ARRAY(statements -> 'Principal' -> 'AWS')
				WHEN JSONB_TYPEOF(statements -> 'Principal' -> 'AWS') = 'array' THEN statements -> 'Principal' -> 'AWS'
			END AS principals,
            -- For each Statement return an array containing the Actions
			CASE
                WHEN JSONB_TYPEOF(statements -> 'Action') = 'string' THEN JSONB_BUILD_ARRAY(statements -> 'Action')
				WHEN JSONB_TYPEOF(statements -> 'Action') = 'array' THEN statements -> 'Action'
			END AS actions
		FROM aws_s3_buckets,
			JSONB_ARRAY_ELEMENTS(policy -> 'Statement') AS statements
		WHERE statements -> 'Effect' = '"Allow"' ) AS flatten_statements,
	JSONB_ARRAY_ELEMENTS(TO_JSONB(actions)) AS a,
	JSONB_ARRAY_ELEMENTS(TO_JSONB(principals)) AS p
WHERE 
    -- Any cross account prinicipals (or unknown principals) get flagged
    (p.value::text not like '"arn:aws:iam::' || account_id || ':%"'OR p.value::text = '"*"')
	-- Any broad permissions or Deletes get flagged
    AND (a.value::text like '"s3:%*"' OR a.value::text like '"s3:DeleteObject"') 

-- This will flag ALL canoninical IDs as NOT COMPLIANT
-- This will flag ALL users that have been deleted as NOT COMPLIANT
-- This will not catch if an explicit deny supercedes the statement