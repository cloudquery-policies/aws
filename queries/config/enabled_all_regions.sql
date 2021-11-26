select
    account_id,
    region,
    arn,
    recording_group_include_global_resource_types,
    recording_group_all_supported,
    status_recording
from
    aws_config_configuration_recorders
where
    recording_group_include_global_resource_types is not true
   or recording_group_all_supported is not true
   or status_recording is not true
   or status_last_status is distinct from 'SUCCESS';
