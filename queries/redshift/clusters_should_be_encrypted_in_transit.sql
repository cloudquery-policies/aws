SELECT account_id,
       id,
       region
FROM aws_redshift_clusters rsc

WHERE EXISTS(SELECT 1
                    FROM aws_redshift_cluster_parameter_groups rscpg
    INNER JOIN aws_redshift_cluster_parameters rscp
        ON
            rscpg.cq_id = rscp.cluster_parameter_group_cq_id
    WHERE rsc.cq_id = rscpg.cluster_cq_id
        AND (
            rscp.parameter_name = 'require_ssl' AND rscp.parameter_value = 'false'
        )
        OR (
            rscp.parameter_name = 'require_ssl' AND rscp.parameter_value IS NULL
        )
        OR NOT EXISTS((SELECT 1
            FROM aws_redshift_cluster_parameters
            WHERE cluster_parameter_group_cq_id = rscpg.cq_id
                AND parameter_name = 'require_ssl'))
);
