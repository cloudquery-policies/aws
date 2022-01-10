SELECT
    *
FROM
    api_gateway_method_settings
WHERE
    stage_data_trace_enabled IS NOT TRUE
    OR caching_enabled IS NOT TRUE
