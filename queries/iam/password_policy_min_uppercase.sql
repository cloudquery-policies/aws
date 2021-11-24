SELECT
    account_id as resource_identifier
FROM
    aws_iam_password_policies
WHERE
    require_uppercase_characters IS DISTINCT FROM TRUE
    or policy_exists IS DISTINCT FROM TRUE
