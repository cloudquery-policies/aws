SELECT arn,
       account_id,
       'a default root object for your distribution is needed' as cq_reason
FROM aws_cloudfront_distributions
WHERE default_root_object = '';
