select
    *
from
    api_gateway_method_settings
where
    stage_caching_enabled is TRUE
    or (
        caching_enabled is TRUE
        and cache_data_encrypted is not TRUE
    );