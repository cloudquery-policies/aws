policy "apigateway" {
    title = "apigateway controls"
    check "1" {
      title = "API Gateway REST and WebSocket API logging should be enabled"
      query = file("queries/apigateway/api_gw_execution_logging_enabled.sql")
    }

    check "2" {
      title = "API Gateway REST API stages should be configured to use SSL certificates for backend authentication"
      query = file("queries/apigateway/api_gw_ssl_enabled.sql")
    }

    check "3" {
      title = "API Gateway REST API stages should have AWS X-Ray tracing enabled"
      query = file("queries/apigateway/api_gw_xray_enabled.sql")
    }

    check "4" {
      title = "API Gateway should be associated with an AWS WAF web ACL"
      query = file("queries/apigateway/api_gw_associated_with_waf.sql")
    }

    check "5" {
      title = "API Gateway REST API cache data should be encrypted at rest"
      query = file("queries/apigateway/api_gw_cache_encrypted.sql")
    }
  }