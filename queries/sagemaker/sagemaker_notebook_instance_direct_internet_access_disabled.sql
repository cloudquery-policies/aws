SELECT account_id,
       region,
       arn,
       name
FROM aws_sagemaker_notebook_instance
WHERE direct_internet_access is true;