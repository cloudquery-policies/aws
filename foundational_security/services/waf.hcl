policy "waf" {
  title = "WAF controls"
  doc   = file("foundational_security/docs/waf.md")
  check "WAF.1" {
    title = "AWS WAF Classic global web ACL logging should be enabled"
    query = file("queries/waf/waf_web_acl_logging_should_be_enabled.sql")
    doc   = file("foundational_security/docs/waf.1.md")
  }
}