SELECT account_id, arn, password_last_used, user_name FROM aws_iam_users
WHERE
    user_name = '<root_account>' AND password_last_used > (
        now() - '30 days'::INTERVAL
    )
