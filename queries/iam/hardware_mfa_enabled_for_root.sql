SELECT aiu.account_id, arn, max(password_last_used) as password_last_used FROM aws_iam_users as aiu
    LEFT JOIN aws_iam_virtual_mfa_devices ON aws_iam_virtual_mfa_devices.user_arn = aiu.arn
WHERE aiu.user_name = '<root_account>' AND (serial_number IS NULL or aiu.mfa_active = false) group by aiu.account_id, arn