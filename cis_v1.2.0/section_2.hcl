policy "2" {
  title = "Section 2: Logging"
  doc   = file("cis_v1.2.0/docs/2.md")

  check "2.1" {
    title = "Ensure CloudTrail is enabled in all regions"
    doc   = file("cis_v1.2.0/docs/2.1.md")
    query = file("queries/cloudtrail/enabled_in_all_regions.sql")
  }

  check "2.2" {
    title = "Ensure CloudTrail log file validation is enabled"
    doc   = file("cis_v1.2.0/docs/2.2.md")
    query = file("queries/cloudtrail/log_file_validation_enabled.sql")
  }

  check "2.4" {
    title = "Ensure CloudTrail trails are integrated with CloudWatch Logs"
    doc   = file("cis_v1.2.0/docs/2.4.md")
    query = file("queries/cloudtrail/integrated_with_cloudwatch_logs.sql")
  }

  check "2.6" {
    title = "Ensure S3 bucket access logging is enabled on the CloudTrail S3 bucket"
    doc   = file("cis_v1.2.0/docs/2.6.md")
    query = file("queries/cloudtrail/bucket_access_logging.sql")
  }

  check "2.7" {
    title = "Ensure CloudTrail logs are encrypted at rest using KMS CMKs"
    doc   = file("cis_v1.2.0/docs/2.7.md")
    query = file("queries/cloudtrail/logs_encrypted.sql")
  }

  check "2.8" {
    title = "Ensure rotation for customer created CMKs is enabled (Scored)"
    doc   = file("cis_v1.2.0/docs/2.8.md")
    query = file("queries/kms/rotation_enabled_for_customer_key.sql")
  }

  check "2.9" {
    title = "Ensure VPC flow logging is enabled in all VPCs (Scored)"
    doc   = file("cis_v1.2.0/docs/2.9.md")
    query = file("queries/ec2/flow_logs_enabled_in_all_vpcs.sql")
  }
}