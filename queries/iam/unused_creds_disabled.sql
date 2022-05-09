SELECT
    account_id, arn, password_last_used, user_name, access_key_id, last_used,
	format('User %s credentials were last used %s', user_name, date_trunc('day', now() - coalesce(password_last_used, last_used))) as cq_reason
FROM
    aws_iam_users
    JOIN aws_iam_user_access_keys
        ON aws_iam_users.cq_id = aws_iam_user_access_keys.user_cq_id
WHERE
    (password_enabled AND password_last_used < (now() - '90 days'::INTERVAL)
        OR (last_used < (now() - '90 days'::INTERVAL)))
