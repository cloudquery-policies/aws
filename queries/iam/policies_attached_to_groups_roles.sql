SELECT aws_iam_users.account_id, arn, user_name,
     format('IAM policy %s attached to user', aiuap.policy_arn) as cq_reason
 FROM aws_iam_users
    JOIN
        aws_iam_user_attached_policies aiuap ON
            aws_iam_users.cq_id = aiuap.user_cq_id
