SELECT t.account_id, t.region, t.arn, cd.name
FROM aws_ecs_task_definitions t
         JOIN aws_ecs_task_definition_container_definitions cd ON t.cq_id = cd.task_definition_cq_id
WHERE t.network_mode = 'host'
  AND (cd.privileged IS DISTINCT FROM TRUE
    AND (cd."user" = 'root' OR cd."user" IS NULL));