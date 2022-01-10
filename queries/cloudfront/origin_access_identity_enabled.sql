SELECT arn,
       account_id
FROM aws_cloudfront_distribution_origins
     JOIN
        aws_cloudfront_distributions ON
            aws_cloudfront_distributions.cq_id =
            aws_cloudfront_distribution_origins.distribution_cq_id
WHERE aws_cloudfront_distribution_origins.domain_name LIKE '%s3.amazonaws.com'
      AND s3_origin_config_origin_access_identity = '';
