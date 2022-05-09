SELECT
    aiu.account_id, arn, max(password_last_used) AS password_last_used,
    'Hardware MFA not enabled for root account' as cq_reason
FROM aws_iam_users AS aiu
    LEFT JOIN
        aws_iam_virtual_mfa_devices ON
            aws_iam_virtual_mfa_devices.user_arn = aiu.arn
WHERE
    aiu.user_name = '<root_account>' AND (
        serial_number IS NULL OR aiu.mfa_active = FALSE
    )
GROUP BY aiu.account_id, arn
