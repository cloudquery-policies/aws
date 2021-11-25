WITH security_group_permissions AS (SELECT sg.account_id,
                                           sg.arn,
                                           sg.region,
                                           segp.cq_id    AS permission_id,
                                           aesgipe.cq_id AS egress_permission_id
                                    FROM aws_ec2_security_groups sg
                                             JOIN aws_ec2_security_group_ip_permissions segp ON
                                        sg.cq_id = segp.security_group_cq_id
                                             JOIN aws_ec2_security_group_ip_permissions_egresses aesgipe ON
                                        sg.cq_id = aesgipe.security_group_cq_id
                                    WHERE sg.group_name = 'default'),
     all_ranges AS (SELECT p.account_id,
                           p.region,
                           p.arn,
                           (SELECT COUNT(*)
                            FROM aws_ec2_security_group_ip_permission_ip_ranges
                            WHERE security_group_ip_permission_cq_id = p.permission_id
                           ) AS in_ips,
                           (SELECT COUNT(*)
                            FROM aws_ec2_security_group_ip_permission_ipv6_ranges aesgipir
                            WHERE security_group_ip_permission_cq_id = p.permission_id
                           ) AS in_ip6s,
                           (SELECT COUNT(*)
                            FROM aws_ec2_security_group_ip_permissions_egress_ip_ranges aesgipir
                            WHERE security_group_ip_permissions_egress_cq_id = p.egress_permission_id
                           ) AS out_ips,
                           (SELECT COUNT(*)
                            FROM aws_ec2_security_group_ip_permissions_egress_ipv6_ranges aesgipir
                            WHERE security_group_ip_permissions_egress_cq_id = p.egress_permission_id
                           ) AS out_ip6s
                    FROM security_group_permissions p)
SELECT account_id, region, arn
FROM all_ranges
WHERE in_ips + in_ip6s + out_ips + out_ip6s > 0;