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
     all_rules AS (SELECT p.account_id,
                          p.arn,
                          p.region,
                          COUNT(*) AS rules
                   FROM security_group_permissions p
                            LEFT JOIN aws_ec2_security_group_ip_permission_ip_ranges in4
                                      ON p.permission_id = in4.security_group_ip_permission_cq_id
                            LEFT JOIN aws_ec2_security_group_ip_permission_ipv6_ranges in6
                                      ON p.permission_id = in6.security_group_ip_permission_cq_id
                            LEFT JOIN aws_ec2_security_group_ip_permissions_egress_ip_ranges out4
                                      ON p.egress_permission_id = out4.security_group_ip_permissions_egress_cq_id
                            LEFT JOIN aws_ec2_security_group_ip_permissions_egress_ipv6_ranges out6
                                      ON p.egress_permission_id = out6.security_group_ip_permissions_egress_cq_id
                   GROUP BY p.account_id, p.arn, p.region
     )
SELECT account_id, arn, region
FROM all_rules
WHERE rules > 0;