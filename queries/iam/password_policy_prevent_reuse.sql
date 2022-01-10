SELECT
    account_id AS resource_identifier
FROM
    aws_iam_password_policies
WHERE
    (
        password_reuse_prevention IS NULL
        OR password_reuse_prevention > 24
    )
    OR policy_exists = FALSE
