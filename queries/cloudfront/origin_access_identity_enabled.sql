select arn,
       account_id
from aws_cloudfront_distribution_origins
         join aws_cloudfront_distributions on aws_cloudfront_distributions.cq_id = aws_cloudfront_distribution_origins.distribution_cq_id
where aws_cloudfront_distribution_origins.domain_name like '%s3.amazonaws.com'
  and s3_origin_config_origin_access_identity = '';
