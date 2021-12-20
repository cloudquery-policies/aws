SELECT account_id, user_name, arn as user_arn,  k.access_key_id
FROM aws_iam_users u
         LEFT JOIN aws_iam_user_access_keys k ON u.cq_id = k.user_cq_id
WHERE DATE_PART('day', NOW() - last_used) > 90;
