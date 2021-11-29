SELECT ec2.id
FROM
  aws_ec2_instances ec2 LEFT OUTER JOIN aws_ssm_instances ssm
  ON ec2.id = ssm.instance_id
WHERE
  ssm.instance_id IS NULL
