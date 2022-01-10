SELECT arn,
       account_id
FROM aws_cloudfront_distribution_origin_groups
     JOIN
        aws_cloudfront_distributions ON
            aws_cloudfront_distributions.cq_id =
            aws_cloudfront_distribution_origin_groups.distribution_cq_id
WHERE members_origin_ids IS NULL;
