policy "elb" {
  title = "ELB controls"
  check "ELB.2" {
    title = "Classic Load Balancers with SSL/HTTPS listeners should use a certificate provided by AWS Certificate Manager"
    query = file("queries/elb/elbv1_cert_provided_by_acm.sql")
  }

  check "ELB.3" {
    title = "Classic Load Balancer listeners should be configured with HTTPS or TLS termination"
    query = file("queries/elb/elbv1_https_or_tls.sql")
  }

  check "ELB.4" {
    title = "Application load balancers should be configured to drop HTTP headers"
    query = file("queries/elb/alb_drop_http_headers.sql")
  }

  check "ELB.5" {
    title = "Application and Classic Load Balancers logging should be enabled"
    query = file("queries/elb/alb_logging_enabled.sql")
  }

  check "ELB.6" {
    title = "Application Load Balancer deletion protection should be enabled"
    query = file("queries/elb/alb_deletion_protection_enabled.sql")
  }

  check "ELB.7" {
    title = "Classic Load Balancers should have connection draining enabled"
    query = file("queries/elb/elbv1_conn_draining_enabled.sql")
  }

  check "ELB.8" {
    title = "Classic Load Balancers with HTTPS/SSL listeners should use a predefined security policy that has strong configuration"
    query = file("queries/elb/elbv1_https_predefined_policy.sql")
  }
}