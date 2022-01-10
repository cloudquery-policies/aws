SELECT
    account_id,
    region,
    arn,
    recording_group_include_global_resource_types,
    recording_group_all_supported,
    status_recording
FROM
    aws_config_configuration_recorders
WHERE
    recording_group_include_global_resource_types IS NOT TRUE
    OR recording_group_all_supported IS NOT TRUE
    OR status_recording IS NOT TRUE
    OR status_last_status IS DISTINCT FROM 'SUCCESS';
