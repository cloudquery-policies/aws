SELECT account_id, 
	CONCAT('following configuration are required and not set:', 
		   CASE WHEN require_uppercase_characters IS NOT TRUE THEN ' uppercase' ELSE '' END,
		   CASE WHEN require_lowercase_characters IS NOT TRUE THEN ', lowercase' ELSE '' END,
		   CASE WHEN require_numbers IS NOT TRUE THEN ', numbers' ELSE '' END,
		   CASE WHEN minimum_password_length < 14 IS NOT TRUE THEN ', minimum password length greater than 14' ELSE '' END,
		   CASE WHEN password_reuse_prevention IS NULL IS NOT TRUE THEN ', password reuse preventions' ELSE '' END,
		   CASE WHEN max_password_age IS NULL IS NOT TRUE THEN ', max password age' ELSE '' END
		  ) as cq_reason
FROM aws_iam_password_policies 
WHERE (
    require_uppercase_characters IS NOT TRUE
    OR require_lowercase_characters IS NOT TRUE
    OR require_numbers IS NOT TRUE
    OR minimum_password_length < 14
    OR password_reuse_prevention IS NULL
    OR max_password_age IS NULL
    OR policy_exists IS NOT TRUE
)
