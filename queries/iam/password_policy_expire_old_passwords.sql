SELECT
    account_id,
    CASE WHEN max_password_age IS NOT NULL THEN format('IAM password policy expire age %s is greater than 90 days', max_password_age)
    ELSE 'IAM password policy is not set to expire'
    END AS cq_reason
FROM
    aws_iam_password_policies
WHERE
    (
        max_password_age IS NULL
        OR max_password_age < 90
    )
    OR policy_exists = FALSE
