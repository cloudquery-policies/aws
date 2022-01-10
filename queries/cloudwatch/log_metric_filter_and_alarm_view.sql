SELECT
    aws_cloudtrail_trails.account_id,
    aws_cloudtrail_trails.region,
    cloud_watch_logs_log_group_arn,
    pattern
FROM aws_cloudtrail_trails
    JOIN aws_cloudtrail_trail_event_selectors
        ON
            aws_cloudtrail_trails.cq_id =
            aws_cloudtrail_trail_event_selectors.trail_cq_id
    JOIN aws_cloudwatchlogs_filters
        ON
            aws_cloudtrail_trails.cloudwatch_logs_log_group_name =
            aws_cloudwatchlogs_filters.log_group_name
    JOIN aws_cloudwatch_alarm_metrics
        ON
            aws_cloudwatchlogs_filters.name =
            aws_cloudwatch_alarm_metrics.metric_stat_metric_name
    JOIN
        aws_cloudwatch_alarms ON
            aws_cloudwatch_alarm_metrics.alarm_cq_id =
            aws_cloudwatch_alarms.cq_id
    JOIN
        aws_sns_subscriptions ON
            aws_sns_subscriptions.topic_arn =
            ANY(aws_cloudwatch_alarms.actions)
WHERE is_multi_region_trail = TRUE
    AND is_logging = TRUE
    AND include_management_events = TRUE
    AND read_write_type = 'All'
    AND aws_sns_subscriptions.arn LIKE 'aws:arn:%'
