SELECT ec2.account_id, ec2.arn as arn, ec2.region as region,
    format('ec2 instance %s should be managed by SSM', ec2.id) as cq_reason
FROM
    aws_ec2_instances ec2 LEFT OUTER JOIN aws_ssm_instances ssm
        ON ec2.id = ssm.instance_id
WHERE
    ssm.instance_id IS NULL
