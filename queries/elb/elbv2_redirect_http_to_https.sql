select account_id, region, arn, protocol, actions.type from aws_elbv2_listeners 
    join aws_elbv2_listener_default_actions as actions on aws_elbv2_listeners.cq_id = actions.listener_cq_id
where protocol = 'HTTP' and (actions.type != 'REDIRECT' OR actions.redirect_config_protocol != 'HTTPS')