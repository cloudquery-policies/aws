SELECT arn,
       account_id
FROM aws_cloudfront_distributions
WHERE web_acl_id = '';
