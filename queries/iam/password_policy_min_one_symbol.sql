SELECT
    account_id,
   'Require symbols in password policy is not set to true' as cq_reason
FROM
    aws_iam_password_policies
WHERE
    require_symbols = FALSE
    OR policy_exists = FALSE
