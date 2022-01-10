SELECT
    *
FROM
    api_gateway_method_settings
WHERE
    stage_caching_enabled IS TRUE
    OR (
        caching_enabled IS TRUE
        AND cache_data_encrypted IS NOT TRUE
    );
