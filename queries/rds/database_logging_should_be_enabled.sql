SELECT arn
FROM aws_rds_instances
WHERE
    enabled_cloudwatch_logs_exports IS NULL
    OR (engine IN ('aurora', 'aurora-mysql', 'mariadb', 'mysql')
                   AND NOT enabled_cloudwatch_logs_exports @> '{audit,error,general,slowquery}'
    )
    OR (engine LIKE '%postgres%'
        AND NOT enabled_cloudwatch_logs_exports @> '{postgresql,upgrade}')
    OR (engine LIKE '%oracle%'
        AND NOT enabled_cloudwatch_logs_exports @> '{alert,audit,trace,listener}'
    )
    OR (engine LIKE '%sqlserver%'
        AND NOT enabled_cloudwatch_logs_exports @> '{error,agent}')
