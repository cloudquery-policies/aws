/* Find Security groups that give access to ipv4 addresses */
SELECT
    t.arn
FROM
    (
        SELECT
            /* create arn for sg */
            'arn:aws:ec2:' || region || ':' || account_id || ':security-group/sg-' || id AS arn,
            /* Calculate total number of IPs a SG rule gives access to */
            (
                split_part(host(broadcast(cidr_ip :: CIDR)), '.', 1) :: bigint * 16777216 + split_part(host(broadcast(cidr_ip :: CIDR)), '.', 2) :: bigint * 65536 + split_part(host(broadcast(cidr_ip :: CIDR)), '.', 3) :: bigint * 256 + split_part(host(broadcast(cidr_ip :: CIDR)), '.', 4) :: bigint
            ) - (
                split_part(host(cidr_ip :: CIDR), '.', 1) :: bigint * 16777216 + split_part(host(cidr_ip :: CIDR), '.', 2) :: bigint * 65536 + split_part(host(cidr_ip :: CIDR), '.', 3) :: bigint * 256 + split_part(host(cidr_ip :: CIDR), '.', 4) :: bigint
            ) AS totalIps
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
                OR 22 BETWEEN from_port
                AND to_port
            )
    ) AS t
GROUP BY
    t.arn
HAVING
    sum(t.totalIps) = 4294967295
    /* this value is the total number of ips in ipv4 space ie 0.0.0.0/0 */
UNION
/* Find Security groups that give access to ipv6 addresses */
SELECT
    t.arn
FROM
    (
        SELECT
            /* create arn for sg */
            'arn:aws:ec2:' || region || ':' || account_id || ':security-group/sg-' || id AS arn,
            /* Calculate total number of IPs a SG rule gives access to */
            round(
                2 ^ (
                    128 - masklen(
                        aws_ec2_security_group_ip_permission_ipv6_ranges.cidr_ipv6 :: cidr
                    )
                ) :: numeric
            ) AS totalIps
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
                OR 22 BETWEEN from_port
                AND to_port
            )
    ) AS t
GROUP BY
    t.arn
HAVING
    sum(t.totalIps) = 340282366920938463463374607431768211456;

/* this value is the total number of ips in ipv6 space ie ::/0 */