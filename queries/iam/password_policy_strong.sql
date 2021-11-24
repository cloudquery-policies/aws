SELECT account_id as resource_identifier FROM aws_iam_password_policies
    WHERE (
        require_uppercase_characters IS DISTINCT FROM TRUE OR
        require_lowercase_characters IS DISTINCT FROM TRUE OR
        require_numbers IS DISTINCT FROM TRUE OR
        minimum_password_length < 14 OR
        password_reuse_prevention is NULL OR
        max_password_age is NULL OR
        policy_exists is NULL
    )