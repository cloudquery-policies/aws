SELECT account_id, i.arn, i.region, c.title, 
format('SSM instances should have association compliance status of complaint have %s instead', c.status) as cq_reason
FROM
    aws_ssm_instances i JOIN aws_ssm_instance_compliance_items c
        ON i.cq_id = c.instance_cq_id
WHERE
    c.compliance_type = 'Association'
    AND c.status IS DISTINCT FROM 'COMPLIANT'
