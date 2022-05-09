SELECT
    account_id,
    format('Minimum password length set to %s, greater than 14 is required', minimum_password_length) as cq_reason
FROM
    aws_iam_password_policies
WHERE
    (minimum_password_length < 14)
    OR policy_exists = FALSE
