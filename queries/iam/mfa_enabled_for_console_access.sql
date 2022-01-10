SELECT account_id, password_last_used, user_name, mfa_active FROM aws_iam_users
WHERE password_enabled AND NOT mfa_active
