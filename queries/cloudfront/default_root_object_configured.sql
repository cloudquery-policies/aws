select arn,
       account_id
from aws_cloudfront_distributions
where default_root_object = '';
