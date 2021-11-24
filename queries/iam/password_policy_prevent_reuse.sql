SELECT
    account_id as resource_identifier
FROM
    aws_iam_password_policies
WHERE
    (
        password_reuse_prevention is NULL
        or password_reuse_prevention > 24
    )
    or policy_exists = FALSE