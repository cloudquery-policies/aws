SELECT arn,
       account_id
FROM
	(   
        -- select all user policies
        SELECT statement,
			aws_iam_users.account_id,
			arn,
			aws_iam_users.cq_id
		FROM aws_iam_user_policies
		 CROSS JOIN LATERAL jsonb_array_elements(aws_iam_user_policies.policy_document -> 'Statement') as statement
		JOIN aws_iam_users ON aws_iam_users.cq_id = aws_iam_user_policies.user_cq_id
		UNION 
        -- select all role policies
        SELECT statement,
			aws_iam_roles.account_id,
			arn,
			aws_iam_roles.cq_id
		FROM aws_iam_role_policies
	 		 CROSS JOIN LATERAL jsonb_array_elements(aws_iam_role_policies.policy_document -> 'Statement') as statement
		JOIN aws_iam_roles ON aws_iam_roles.cq_id = aws_iam_role_policies.role_cq_id
		WHERE LOWER(arn) NOT LIKE 'arn:aws:iam::%:role/aws-service-role/%'
		UNION 
        -- select all group policies
        SELECT statement,
			aws_iam_groups.account_id,
			arn,
			aws_iam_groups.cq_id
		FROM aws_iam_group_policies
	 	 		 CROSS JOIN LATERAL jsonb_array_elements(aws_iam_group_policies.policy_document -> 'Statement') as statement
		JOIN aws_iam_groups ON aws_iam_groups.cq_id = aws_iam_group_policies.group_cq_id) T
WHERE 
	statement ->> 'Effect' = 'Allow'
	AND LOWER(statement::text)::JSONB -> 'resource' ?| array[
		'*',
		'arn:aws:kms:*:*:key/*',
		'arn:aws:kms:*:' || account_id || ':key/*'
		'arn:aws:kms:*:*:alias/*',
		'arn:aws:kms:*:' || account_id || ':alias/*'
	] --noqa

	AND LOWER(statement::text)::JSONB -> 'action' ?| array[
		'*',
		'kms:*',
		'kms:decrypt',
		'kms:encrypt*',
		'kms:reencryptfrom'
	]