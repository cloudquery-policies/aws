SELECT
    aws_cloudtrail_trails.account_id,
    arn,
    latest_cloud_watch_logs_delivery_time
FROM aws_cloudtrail_trails
WHERE
    cloud_watch_logs_log_group_arn IS NULL
    OR latest_cloud_watch_logs_delivery_time < (
        now() - '1 days'::INTERVAL
    )
