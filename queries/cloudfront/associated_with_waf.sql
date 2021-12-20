select arn,
       account_id
from aws_cloudfront_distributions
where web_acl_id = '';
