policy "cloudtrail" {
  title = "cloudtrail controls"
  check "cloudtrail.1" {
    title = "CloudTrail should be enabled and configured with at least one multi-Region trail and not have management events excluded"
    query = file("queries/cloudtrail/enabled_in_all_regions.sql")
  }

  check "cloudtrail.2" {
    title = "CloudTrail should have encryption at rest enabled"
    query = file("queries/cloudtrail/logs_encrypted.sql")
  }

  check "cloudtrail.4" {
    title = "Ensure CloudTrail log file validation is enabled"
    query = file("queries/cloudtrail/log_file_validation_enabled.sql")
  }

  check "cloudtrail.5" {
    title = "Ensure CloudTrail trails are integrated with Amazon CloudWatch Logs"
    query = file("queries/cloudtrail/integrated_with_cloudwatch_logs.sql")
  }
}