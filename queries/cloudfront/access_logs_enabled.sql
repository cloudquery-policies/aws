SELECT arn,
       account_id
FROM aws_cloudfront_distributions
WHERE logging_enabled = TRUE;
