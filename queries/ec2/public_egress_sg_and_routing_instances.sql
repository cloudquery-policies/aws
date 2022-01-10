-- Find all AWS instances that are in a subnet that includes a catchall route
SELECT id,
    region,
    account_id,
    vpc_id
FROM aws_ec2_instances
WHERE subnet_id IN
    --  Find all subnets that include a route table that inclues a catchall route
    (SELECT subnet_id
        FROM aws_ec2_route_tables
            JOIN
                aws_ec2_route_table_associations ON
                    aws_ec2_route_table_associations.route_table_cq_id = aws_ec2_route_tables.cq_id
        WHERE aws_ec2_route_tables.cq_id IN
            --  Find all routes in any route table that contains a route to 0.0.0.0/0 or ::/0
            (SELECT route_table_cq_id
                FROM aws_ec2_route_table_routes
                WHERE destination_cidr_block = '0.0.0.0/0'
                    OR destination_ipv6_cidr_block = '::/0'))
    AND cq_id IN
    -- 	Find all instances that have egress rule that allows access to all ip addresses
    (SELECT instance_cq_id
        FROM aws_ec2_instance_security_groups
            JOIN aws_security_group_egress_rules ON group_id = id
        WHERE (ip = '0.0.0.0/0' OR ip = '::/0'))
