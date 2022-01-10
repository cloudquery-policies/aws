SELECT
    arn
FROM
    aws_ec2_security_groups
    JOIN
        aws_ec2_security_group_ip_permissions ON
            aws_ec2_security_groups.cq_id =
            aws_ec2_security_group_ip_permissions.security_group_cq_id
WHERE
    group_name = 'default'
