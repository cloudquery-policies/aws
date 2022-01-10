SELECT
    account_id, region, cloud_watch_logs_log_group_arn
FROM aws_log_metric_filter_and_alarm
WHERE
    pattern = '{ ($.eventName = DeleteGroupPolicy) '
    || '|| ($.eventName = DeleteRolePolicy) '
    || '|| ($.eventName = DeleteUserPolicy) '
    || '|| ($.eventName = PutGroupPolicy) '
    || '|| ($.eventName = PutRolePolicy) '
    || '|| ($.eventName = PutUserPolicy) '
    || '|| ($.eventName = CreatePolicy) '
    || '|| ($.eventName = DeletePolicy) '
    || '|| ($.eventName=CreatePolicyVersion) '
    || '|| ($.eventName=DeletePolicyVersion) '
    || '|| ($.eventName=AttachRolePolicy) '
    || '|| ($.eventName=DetachRolePolicy) '
    || '|| ($.eventName=AttachUserPolicy) '
    || '|| ($.eventName = DetachUserPolicy) '
    || '|| ($.eventName = AttachGroupPolicy) '
    || '|| ($.eventName = DetachGroupPolicy)}'
