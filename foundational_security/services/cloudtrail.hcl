policy "cloudtrail" {
  title = "cloudtrail controls"
  doc   = file("foundational_security/docs/CloudTrail.md")
  check "CloudTrail.1" {
    title = "CloudTrail should be enabled and configured with at least one multi-Region trail and not have management events excluded"
    query = file("queries/cloudtrail/enabled_in_all_regions.sql")
    doc   = file("foundational_security/docs/CloudTrail.1.md")
  }

  check "CloudTrail.2" {
    title = "CloudTrail should have encryption at rest enabled"
    query = file("queries/cloudtrail/logs_encrypted.sql")
    doc   = file("foundational_security/docs/CloudTrail.2.md")
  }

  check "CloudTrail.4" {
    title = "Ensure CloudTrail log file validation is enabled"
    query = file("queries/cloudtrail/log_file_validation_enabled.sql")
    doc   = file("foundational_security/docs/CloudTrail.4.md")
  }

  check "CloudTrail.5" {
    title = "Ensure CloudTrail trails are integrated with Amazon CloudWatch Logs"
    query = file("queries/cloudtrail/integrated_with_cloudwatch_logs.sql")
    doc   = file("foundational_security/docs/CloudTrail.5.md")
  }
}