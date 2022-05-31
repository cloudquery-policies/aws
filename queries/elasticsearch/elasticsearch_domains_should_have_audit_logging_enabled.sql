SELECT account_id, region, arn,
    CASE
        WHEN  log_publishing_options -> 'AUDIT_LOGS' -> 'Enabled' IS DISTINCT FROM 'true' THEN 'audit logs should be enabled'
        WHEN  log_publishing_options -> 'AUDIT_LOGS' -> 'CloudWatchLogsLogGroupArn' IS NULL THEN 'audit logs should be sent to Cloudwatch'
    END as cq_reason
FROM aws_elasticsearch_domains
WHERE
    log_publishing_options -> 'AUDIT_LOGS' -> 'Enabled' IS DISTINCT FROM 'true'
    OR log_publishing_options -> 'AUDIT_LOGS' -> 'CloudWatchLogsLogGroupArn' IS NULL
