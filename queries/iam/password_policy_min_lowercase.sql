SELECT
    account_id,
    'Require lowercase in password policy is not set to true' as cq_reason
FROM
    aws_iam_password_policies
WHERE
    require_lowercase_characters = FALSE OR policy_exists = FALSE
