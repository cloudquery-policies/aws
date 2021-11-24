SELECT
    account_id as resource_identifier
FROM
    aws_iam_password_policies
WHERE
    (
        max_password_age is NULL
        or max_password_age < 90
    )
    or policy_exists = false