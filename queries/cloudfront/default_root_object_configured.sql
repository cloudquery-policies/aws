SELECT arn,
       account_id
FROM aws_cloudfront_distributions
WHERE default_root_object = '';
