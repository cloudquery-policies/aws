policy "waf" {
    title = "WAF controls"
    check "1" {
      title = "AWS WAF Classic global web ACL logging should be enabled"
      query = "select 1;"
    }
  }