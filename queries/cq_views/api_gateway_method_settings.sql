SELECT cq_id,
       stage_name,
       rest_api_cq_id,
       tracing_enabled AS stage_data_trace_enabled,
       cache_cluster_enabled AS stage_caching_enabled,
       web_acl_arn AS waf,
       client_certificate_id AS cert,
       key AS method,
       (value::JSON -> 'DataTraceEnabled')::TEXT::BOOLEAN AS data_trace_enabled,
       (value::JSON -> 'CachingEnabled')::TEXT::BOOLEAN AS caching_enabled,
       (value::JSON -> 'CacheDataEncrypted')::TEXT::BOOLEAN AS cache_data_encrypted,
       (value::JSON -> 'LoggingLevel')::TEXT AS logging_level
FROM aws_apigateway_rest_api_stages,
    JSONB_EACH_TEXT(aws_apigateway_rest_api_stages.method_settings)
