
-- Find all AWS instances that have a security group that allows unrestricted egress
SELECT id,
	region,
	account_id,
	vpc_id
FROM aws_ec2_instances
WHERE  cq_id in
	-- 	Find all instances that have egress rule that allows access to all ip addresses
	(SELECT instance_cq_id
		FROM aws_ec2_instance_security_groups
		JOIN aws_security_group_egress_rules ON group_id = id
		WHERE (ip = '0.0.0.0/0' OR ip = '::/0'))