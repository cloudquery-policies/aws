SELECT c.account_id, c.region, s.cluster_arn, s.name, s.arn, 'service is assigned a public ip' as cq_reason
FROM aws_ecs_clusters c
     LEFT JOIN aws_ecs_cluster_services s ON c.cq_id = s.cluster_cq_id
WHERE
    network_configuration_awsvpc_configuration_assign_public_ip IS DISTINCT FROM 'DISABLED'
;
