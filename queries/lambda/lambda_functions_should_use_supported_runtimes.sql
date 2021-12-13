SELECT account_id,
       region,
       arn,
       runtime
FROM aws_lambda_functions
    WHERE runtime NOT IN (SELECT name from aws_lambda_runtimes)