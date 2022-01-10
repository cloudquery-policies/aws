SELECT account_id, region, arn
FROM aws_elasticsearch_domains
WHERE
    log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'Enabled' IS DISTINCT FROM 'true'
    OR log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'CloudWatchLogsLogGroupArn' IS NULL
