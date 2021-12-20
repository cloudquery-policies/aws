
SELECT DISTINCT arn,
	region,
	account_id
FROM aws_lambda_functions,
	UNNEST(vpc_config_security_group_ids) sgs,
	UNNEST(vpc_config_subnet_ids) sns
WHERE sns in 
--  Find all subnets that include a route table that inclues a catchall route
		(SELECT subnet_id
			FROM public.aws_ec2_route_tables
			JOIN aws_ec2_route_table_associations ON aws_ec2_route_table_associations.route_table_cq_id = aws_ec2_route_tables.cq_id
			WHERE aws_ec2_route_tables.cq_id in 
            --  Find all routes in any route table that contains a route to 0.0.0.0/0 or ::/0
                (SELECT route_table_cq_id
                    FROM public.aws_ec2_route_table_routes
                    WHERE destination_cidr_block = '0.0.0.0/0'
                        OR destination_ipv6_cidr_block = '::/0'))
	AND sgs in 
    -- 	Find all functions that have egress rule that allows access to all ip addresses
		(SELECT group_id
			FROM aws_ec2_instance_security_groups
			JOIN aws_security_group_egress_rules ON group_id = id
			WHERE (ip = '0.0.0.0/0'
										OR ip = '::/0') )
UNION
-- Find all Lambda functions that do not run in a VPC
SELECT DISTINCT arn,
	region,
	account_id
FROM aws_lambda_functions
WHERE vpc_config_vpc_id IS NULL
	OR vpc_config_vpc_id = ''

-- Note: We do not restrict the search to specific Runtimes