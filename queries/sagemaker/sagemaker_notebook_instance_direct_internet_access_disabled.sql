SELECT account_id,
       region,
       arn
FROM aws_sagemaker_notebook_instance
WHERE direct_internet_access = true;