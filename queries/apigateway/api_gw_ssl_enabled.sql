select
    cq_id::text,
    stage_name,
    rest_api_cq_id::text,
    stage_data_trace_enabled,
    stage_caching_enabled,
    waf,
    cert,
    method,
    data_trace_enabled,
    caching_enabled,
    cache_data_encrypted,
    logging_level
from
    api_gateway_method_settings
where
    stage_data_trace_enabled is not NULL