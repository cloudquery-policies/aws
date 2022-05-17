SELECT account_id, region, arn, protocol, actions.type,
'HTTP should redirect to HTTPS' as cq_reason
 FROM aws_elbv2_listeners
    JOIN
        aws_elbv2_listener_default_actions AS actions ON
            aws_elbv2_listeners.cq_id = actions.listener_cq_id
WHERE
    protocol = 'HTTP' AND (
        actions.type != 'REDIRECT' OR actions.redirect_config_protocol != 'HTTPS'
    )
