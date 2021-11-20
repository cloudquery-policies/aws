SELECT account_id, arn, password_last_used, user_name, access_key_id, last_used FROM aws_iam_users
    JOIN aws_iam_user_access_keys on aws_iam_users.cq_id = aws_iam_user_access_keys.user_cq_id
WHERE (password_enabled AND password_last_used < (now() - '90 days'::interval) OR
        (last_used < (now() - '90 days'::interval)))