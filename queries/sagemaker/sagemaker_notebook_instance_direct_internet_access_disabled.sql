SELECT account_id,
       region,
       arn,
       name,
       'notebook instance has direct access to internet enabled' as cq_reason
FROM aws_sagemaker_notebook_instances
WHERE direct_internet_access IS TRUE;
