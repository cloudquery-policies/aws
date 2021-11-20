SELECT account_id, arn, password_last_used, user_name, mfa_active FROM aws_iam_users
WHERE user_name = '<root_account>' AND NOT mfa_active