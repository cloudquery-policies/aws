SELECT arn
FROM aws_elasticbeanstalk_environments
WHERE health_status IS NULL
    OR health IS NULL
