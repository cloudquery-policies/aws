select account_id, region, name from aws_elbv1_load_balancers where attributes_connection_draining_enabled is not true;
