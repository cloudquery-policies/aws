SELECT
    account_id, region, cloud_watch_logs_log_group_arn
FROM aws_log_metric_filter_and_alarm
WHERE
    pattern = '{ ($.eventName = CreateVpc) '
    || '|| ($.eventName = DeleteVpc) '
    || '|| ($.eventName = ModifyVpcAttribute) '
    || '|| ($.eventName = AcceptVpcPeeringConnection) '
    || '|| ($.eventName = CreateVpcPeeringConnection) '
    || '|| ($.eventName = DeleteVpcPeeringConnection) '
    || '|| ($.eventName = RejectVpcPeeringConnection) '
    || '|| ($.eventName = AttachClassicLinkVpc) '
    || '|| ($.eventName = DetachClassicLinkVpc) '
    || '|| ($.eventName = DisableVpcClassicLink) '
    || '|| ($.eventName = EnableVpcClassicLink) }'
