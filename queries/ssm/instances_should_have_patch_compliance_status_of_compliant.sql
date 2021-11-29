SELECT i.arn, c.title
FROM
  aws_ssm_instances i JOIN aws_ssm_instance_compliance_items c
  ON i.cq_id = c.instance_cq_id
WHERE
  c.compliance_type = 'Patch'
  AND c.status IS DISTINCT FROM 'COMPLIANT'
