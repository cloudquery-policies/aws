SELECT c.arn
FROM
  aws_emr_clusters c
  LEFT OUTER JOIN aws_ec2_subnets s
  ON c.ec2_instance_attribute_subnet_id = s.id
WHERE
  s.map_public_ip_on_launch
  AND c.state IN ('RUNNING', 'WAITING')
