select arn,
       account_id
from aws_cloudfront_distributions
where logging_enabled = true;
