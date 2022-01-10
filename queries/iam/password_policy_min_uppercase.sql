SELECT
    account_id AS resource_identifier
FROM
    aws_iam_password_policies
WHERE
    require_uppercase_characters IS NOT TRUE OR policy_exists IS NOT TRUE
