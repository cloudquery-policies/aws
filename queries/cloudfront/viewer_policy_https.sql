with data as
         (select distinct distribution_cq_id
          from aws_cloudfront_distribution_cache_behaviors
          where viewer_protocol_policy = 'allow-all' )
select arn,
       account_id
from aws_cloudfront_distributions
         left join data on data.distribution_cq_id = aws_cloudfront_distributions.cq_id
where distribution_cq_id is not null
   or cache_behavior_viewer_protocol_policy = 'allow-all';
