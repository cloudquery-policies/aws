SELECT
    account_id,
    'Require uppercase in password policy is not set to true' as cq_reason
FROM
    aws_iam_password_policies
WHERE
    require_uppercase_characters IS NOT TRUE OR policy_exists IS NOT TRUE
