SELECT account_id, user_name, arn AS user_arn, k.access_key_id,
     format('key %s was last rotated %s days ago', k.access_key_id, DATE_PART('day', NOW() - last_rotated)) as cq_reason
FROM aws_iam_users u
     LEFT JOIN aws_iam_user_access_keys k ON u.cq_id = k.user_cq_id
WHERE DATE_PART('day', NOW() - last_rotated) > 90
