SELECT account_id,
       region,
       arn,
       name
FROM aws_sagemaker_notebook_instances
WHERE direct_internet_access IS TRUE;
