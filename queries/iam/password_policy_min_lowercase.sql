SELECT
    account_id AS resource_identifier
FROM
    aws_iam_password_policies
WHERE
    require_lowercase_characters = FALSE OR policy_exists = FALSE
