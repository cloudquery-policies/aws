SELECT
    account_id as resource_identifier
FROM
    aws_iam_password_policies
WHERE
    require_numbers = FALSE
    or policy_exists = FALSE