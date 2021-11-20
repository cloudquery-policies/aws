SELECT aws_iam_users.account_id, arn, user_name FROM aws_iam_users
    JOIN aws_iam_user_attached_policies aiuap on aws_iam_users.cq_id = aiuap.user_cq_id