SELECT account_id,
       region,
       arn,
       runtime
FROM aws_lambda_functions
WHERE runtime NOT IN (SELECT name FROM aws_lambda_runtimes)
