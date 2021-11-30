-- https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html
-- Last update: 2021-11-30

SELECT account_id,
       region,
       arn,
       runtime
FROM aws_lambda_functions
    WHERE runtime NOT IN ('nodejs14.x', 'nodejs12.x', 'nodejs10.x', 'python3.9', 'python3.8', 'python3.7', 'python3.6', 'python2.7', 'ruby2.5', 'ruby2.7', 'java11', 'java8', 'go1.x', 'dotnetcore2.1', 'dotnetcore3.1');