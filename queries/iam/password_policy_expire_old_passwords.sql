SELECT
    account_id AS resource_identifier
FROM
    aws_iam_password_policies
WHERE
    (
        max_password_age IS NULL
        OR max_password_age < 90
    )
    OR policy_exists = FALSE
