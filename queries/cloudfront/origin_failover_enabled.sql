SELECT arn,
       account_id,
       'ensure at least 2 origins are specified in order to increase availability' as cq_reason
FROM aws_cloudfront_distribution_origin_groups
     JOIN
        aws_cloudfront_distributions ON
            aws_cloudfront_distributions.cq_id =
            aws_cloudfront_distribution_origin_groups.distribution_cq_id
WHERE members_origin_ids IS NULL;
