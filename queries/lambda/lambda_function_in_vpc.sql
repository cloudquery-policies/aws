SELECT account_id,
       region,
       arn
FROM aws_lambda_functions
WHERE vpc_config_vpc_id IS NULL
   OR vpc_config_vpc_id = ''
