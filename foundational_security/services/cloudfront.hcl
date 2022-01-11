policy "cloudfront" {
    title = "cloudfront controls"
    check "1" {
      title = "CloudFront distributions should have a default root object configured"
      query = file("queries/cloudfront/default_root_object_configured.sql")
    }

    check "2" {
      title = "CloudFront distributions should have origin access identity enabled"
      query = file("queries/cloudfront/origin_access_identity_enabled.sql")
    }

    check "3" {
      title = "CloudFront distributions should require encryption in transit"
      query = file("queries/cloudfront/viewer_policy_https.sql")
    }

    check "4" {
      title = "CloudFront distributions should have origin failover configured"
      query = file("queries/cloudfront/origin_failover_enabled.sql")
    }

    check "5" {
      title = "CloudFront distributions should have logging enabled"
      query = file("queries/cloudfront/access_logs_enabled.sql")
    }

    check "6" {
      title = "CloudFront distributions should have AWS WAF enabled"
      query = file("queries/cloudfront/associated_with_waf.sql")
    }
  }