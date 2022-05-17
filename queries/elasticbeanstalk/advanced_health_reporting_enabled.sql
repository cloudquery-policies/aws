SELECT arn, 'advanced health reporting should be enabled' as cq_reason
FROM aws_elasticbeanstalk_environments
WHERE health_status IS NULL
    OR health IS NULL
