WITH endpoints AS (SELECT vpc_id
                   FROM aws_ec2_vpc_endpoints
                   WHERE vpc_endpoint_type = 'Interface'
                     AND service_name ~ CONCAT('com.amazonaws.', region, '.ec2'))
SELECT account_id,
       region,
       id
FROM aws_ec2_vpcs v
         LEFT JOIN endpoints e
                   ON v.id = e.vpc_id
WHERE e.vpc_id IS NULL;