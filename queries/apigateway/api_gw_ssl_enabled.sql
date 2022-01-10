SELECT
    cq_id::TEXT,
    stage_name,
    rest_api_cq_id::TEXT,
    stage_data_trace_enabled,
    stage_caching_enabled,
    waf,
    cert,
    method,
    data_trace_enabled,
    caching_enabled,
    cache_data_encrypted,
    logging_level
FROM
    api_gateway_method_settings
WHERE
    stage_data_trace_enabled IS NOT NULL
