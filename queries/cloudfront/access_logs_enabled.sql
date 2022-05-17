SELECT arn,
       account_id,
       'access logs should be enabled' as cq_reason
FROM aws_cloudfront_distributions
WHERE logging_enabled = TRUE;
