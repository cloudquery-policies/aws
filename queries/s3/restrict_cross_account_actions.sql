SELECT ARN,
	ACCOUNT_ID,
	A.VALUE::text AS ACTION,
	P.VALUE::text AS USER
FROM
	(SELECT AWS_S3_BUCKETS.ARN,
			ACCOUNT_ID,
			CASE
							WHEN JSONB_TYPEOF(STATEMENTS -> 'Principal') = 'string' THEN JSONB_BUILD_ARRAY(STATEMENTS -> 'Principal')
							WHEN JSONB_TYPEOF(STATEMENTS -> 'Principal' -> 'AWS') = 'string' THEN JSONB_BUILD_ARRAY(STATEMENTS -> 'Principal' -> 'AWS')
							WHEN JSONB_TYPEOF(STATEMENTS -> 'Principal' -> 'AWS') = 'array' THEN STATEMENTS -> 'Principal' -> 'AWS'
			END AS PRINCIPALS,
			CASE
							WHEN JSONB_TYPEOF(STATEMENTS -> 'Action') = 'string' THEN JSONB_BUILD_ARRAY(STATEMENTS -> 'Action')
							WHEN JSONB_TYPEOF(STATEMENTS -> 'Action') = 'array' THEN STATEMENTS -> 'Action'
			END AS ACTIONS
		FROM AWS_S3_BUCKETS,
			JSONB_ARRAY_ELEMENTS(POLICY -> 'Statement') AS STATEMENTS
		WHERE STATEMENTS -> 'Effect' = '"Allow"' ) AS FOO,
	JSONB_ARRAY_ELEMENTS(TO_JSONB(ACTIONS)) AS A,
	JSONB_ARRAY_ELEMENTS(TO_JSONB(PRINCIPALS)) AS P
WHERE (P.VALUE::text not like '"arn:aws:iam::' || ACCOUNT_ID || ':%"'
							OR P.VALUE::text = '"*"')
	AND (A.VALUE::text like '"s3:%*"'
						OR A.VALUE::text like '"s3:DeleteObject"') 
-- This will flag ALL canoninical IDs as NOT COMPLIANT
-- This will flag ALL users that have been deleted as NOT COMPLIANT