select
    cq_id,
    stage_name,
    rest_api_cq_id,
    tracing_enabled as stage_data_trace_enabled,
    cache_cluster_enabled as stage_caching_enabled,
    web_acl_arn as waf,
    client_certificate_id as cert,
    key as method,
    (value :: json -> 'DataTraceEnabled')::TEXT::BOOLEAN as data_trace_enabled,
    (value::json ->'CachingEnabled')::TEXT::BOOLEAN as caching_enabled,
    (value::json -> 'CacheDataEncrypted')::TEXT::BOOLEAN as cache_data_encrypted,
    (value::json -> 'LoggingLevel')::TEXT as logging_level
    
from
    aws_apigateway_rest_api_stages,
    jsonb_each_text(aws_apigateway_rest_api_stages.method_settings)
