policy "waf" {
  title = "WAF controls"
  doc   = file("foundational_security/docs/waf.md")
  check "WAF.1" {
    title = "AWS WAF Classic global web ACL logging should be enabled"
    query = "select 1;"
    doc   = file("foundational_security/docs/waf.1.md")
  }
}