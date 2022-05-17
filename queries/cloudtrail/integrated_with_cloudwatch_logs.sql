SELECT
    aws_cloudtrail_trails.account_id,
    arn,
    CASE
        WHEN cloud_watch_logs_log_group_arn IS NULL THEN 'logs should be sent to cloudwatch logs'
        WHEN latest_cloud_watch_logs_delivery_time < (now() - '1 days'::INTERVAL) THEN 'no logs have been delivered in the last 24 hours, ensure that the delivery is working properly'
    END as cq_reason
FROM aws_cloudtrail_trails
WHERE
    cloud_watch_logs_log_group_arn IS NULL
    OR latest_cloud_watch_logs_delivery_time < (
        now() - '1 days'::INTERVAL
    )
