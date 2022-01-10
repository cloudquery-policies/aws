SELECT
    account_id AS resource_identifier
FROM
    aws_iam_password_policies
WHERE
    (minimum_password_length < 14)
    OR policy_exists = FALSE
