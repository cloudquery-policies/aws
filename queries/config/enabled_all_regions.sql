SELECT
    account_id,
    region,
    arn,
    recording_group_include_global_resource_types,
    recording_group_all_supported,
    status_recording,
    CASE
        WHEN recording_group_include_global_resource_types IS NOT TRUE THEN 'config should be recording all resources (including global resources)'
        WHEN recording_group_all_supported IS NOT TRUE THEN 'config should be recording all resources'
        WHEN status_recording IS NOT TRUE THEN 'config status recording should be enabled'
        WHEN status_last_status IS DISTINCT FROM 'SUCCESS' THEN 'error with last config status recording'
    END as cq_reason
FROM
    aws_config_configuration_recorders
WHERE
    recording_group_include_global_resource_types IS NOT TRUE
    OR recording_group_all_supported IS NOT TRUE
    OR status_recording IS NOT TRUE
    OR status_last_status IS DISTINCT FROM 'SUCCESS';
