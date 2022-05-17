SELECT arn,
       account_id,
       'distribution should be associated with a WAF ACL' as cq_reason
FROM aws_cloudfront_distributions
WHERE web_acl_id = '';
