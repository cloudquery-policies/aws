SELECT account_id, region, id, arn
FROM aws_ec2_ebs_volumes
WHERE encrypted IS FALSE;