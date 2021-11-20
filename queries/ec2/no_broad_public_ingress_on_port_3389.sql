/* Find Security groups that give access to ipv4 addresses */
SELECT
    /* create arn for sg */
    'arn:aws:ec2:' || region || ':' || account_id || ':security-group/sg-' || id AS arn
FROM
    aws_ec2_security_groups
    JOIN aws_ec2_security_group_ip_permissions ON aws_ec2_security_groups.cq_id = aws_ec2_security_group_ip_permissions.security_group_cq_id
    JOIN aws_ec2_security_group_ip_permission_ip_ranges ON aws_ec2_security_group_ip_permissions.cq_id = aws_ec2_security_group_ip_permission_ip_ranges.security_group_ip_permission_cq_id
WHERE
    (
        (
            from_port IS NULL
            AND to_port IS NULL
        )
        OR 3389 BETWEEN from_port
        AND to_port
        AND cidr_ip = '0.0.0.0/0'
    )
UNION
/* Find Security group rules that give access to ipv6 addresses */
SELECT
    'arn:aws:ec2:' || region || ':' || account_id || ':security-group/sg-' || id AS arn
FROM
    aws_ec2_security_groups
    JOIN aws_ec2_security_group_ip_permissions ON aws_ec2_security_groups.cq_id = aws_ec2_security_group_ip_permissions.security_group_cq_id
    JOIN aws_ec2_security_group_ip_permission_ipv6_ranges ON aws_ec2_security_group_ip_permissions.cq_id = aws_ec2_security_group_ip_permission_ipv6_ranges.security_group_ip_permission_cq_id
WHERE
    (
        (
            from_port IS NULL
            AND to_port IS NULL
        )
        OR 3389 BETWEEN from_port
        AND to_port
        AND aws_ec2_security_group_ip_permission_ipv6_ranges.cidr_ipv6 = '::/0'
    );