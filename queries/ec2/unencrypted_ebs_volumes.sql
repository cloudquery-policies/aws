SELECT account_id, region, id, arn, 'there is no direct way to encrypt an existing volume or snapshot. You should createa a new volume and ensure that encryption is enabled' as cq_reason
FROM aws_ec2_ebs_volumes
WHERE encrypted IS FALSE;
