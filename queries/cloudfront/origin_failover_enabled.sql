select arn,
       account_id
from aws_cloudfront_distribution_origin_groups
         join aws_cloudfront_distributions on aws_cloudfront_distributions.cq_id = aws_cloudfront_distribution_origin_groups.distribution_cq_id
where members_origin_ids is null;
