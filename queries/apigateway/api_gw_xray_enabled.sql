select
    *
from
    api_gateway_method_settings
where
    stage_data_trace_enabled is not TRUE
    or caching_enabled is not TRUE