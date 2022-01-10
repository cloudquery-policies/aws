SELECT
    account_id, region, cloud_watch_logs_log_group_arn
FROM aws_log_metric_filter_and_alarm
WHERE
    pattern = '{ ($.eventSource = s3.amazonaws.com) '
    || '&& (($.eventName = PutBucketAcl) '
    || '|| ($.eventName = PutBucketPolicy) '
    || '|| ($.eventName = PutBucketCors) '
    || '|| ($.eventName = PutBucketLifecycle) '
    || '|| ($.eventName = PutBucketReplication) '
    || '|| ($.eventName = DeleteBucketPolicy) '
    || '|| ($.eventName = DeleteBucketCors) '
    || '|| ($.eventName = DeleteBucketLifecycle) '
    || '|| ($.eventName = DeleteBucketReplication)) }'
