SELECT
    account_id as resource_identifier
FROM
    aws_iam_password_policies
WHERE
    (minimum_password_length < 14)
    or policy_exists = false
