SELECT
    account_id, region, cloud_watch_logs_log_group_arn
FROM aws_log_metric_filter_and_alarm
WHERE
    pattern = '{($.eventSource = kms.amazonaws.com) '
    || '&& (($.eventName=DisableKey)||($.eventName=ScheduleKeyDeletion)) }"'
