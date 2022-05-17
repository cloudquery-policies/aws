WITH data AS (
    SELECT DISTINCT distribution_cq_id
    FROM aws_cloudfront_distribution_cache_behaviors
    WHERE viewer_protocol_policy = 'allow-all'
)
SELECT arn,
       account_id,
       'only encrypted connections over HTTPS (TLS) should be accepted by the distribution' as cq_reason
FROM aws_cloudfront_distributions
     LEFT JOIN
        data ON data.distribution_cq_id = aws_cloudfront_distributions.cq_id
WHERE distribution_cq_id IS NOT NULL
      OR cache_behavior_viewer_protocol_policy = 'allow-all';
