policy "elbv2" {
  title = "ELBv2 controls"
  doc   = file("foundational_security/docs/ELBv2.md")
  check "ELBv2.1" {
    title = "Application Load Balancer should be configured to redirect all HTTP requests to HTTPS"
    query = file("queries/elb/elbv2_redirect_http_to_https.sql")
    doc   = file("foundational_security/docs/ELBv2.1.md")
  }
}