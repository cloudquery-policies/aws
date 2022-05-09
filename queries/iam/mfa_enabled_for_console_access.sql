SELECT account_id, arn, password_last_used, user_name, mfa_active,
format('MFA is disabled for user %s', user_name) as cq_reason
FROM aws_iam_users
WHERE password_enabled AND NOT mfa_active
