SELECT
    account_id, region, name
FROM
    aws_elbv1_load_balancers
WHERE attributes_connection_draining_enabled IS NOT TRUE;
