SELECT
    account_id, arn, password_last_used, user_name, mfa_active,
    'MFA is not enabled for root account' as cq_reason
FROM aws_iam_users
WHERE user_name = '<root_account>' AND NOT mfa_active
