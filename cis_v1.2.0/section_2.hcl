policy "2" {
    description = "Section 2: Logging"
    readme = file("cis_v1.2.0/docs/2.md")

    check "2.1" {
      description = "AWS CIS 2.1 Ensure CloudTrail is enabled in all regions"
      readme = file("cis_v1.2.0/docs/2.1.md")
      query       = file("queries/cloudtrail/enabled_in_all_regions.sql")
    }

    check "2.2" {
      description = "AWS CIS 2.2 Ensure CloudTrail log file validation is enabled"
      readme = file("cis_v1.2.0/docs/2.2.md")
      query       = file("queries/cloudtrail/log_file_validation_enabled.sql")
    }

    check "2.4" {
      description = "AWS CIS 2.4 Ensure CloudTrail trails are integrated with CloudWatch Logs"
      readme = file("cis_v1.2.0/docs/2.4.md")
      query       = file("queries/cloudtrail/integrated_with_cloudwatch_logs.sql")
    }

    check "2.6" {
      description = "AWS CIS 2.6 Ensure S3 bucket access logging is enabled on the CloudTrail S3 bucket"
      readme = file("cis_v1.2.0/docs/2.6.md")
      query       = file("queries/cloudtrail/bucket_access_logging.sql")
    }

    check "2.7" {
      description = "AWS CIS 2.7 Ensure CloudTrail logs are encrypted at rest using KMS CMKs"
      readme = file("cis_v1.2.0/docs/2.7.md")
      query       = file("queries/cloudtrail/logs_encrypted.sql")
    }

    check "2.8" {
      description = "AWS CIS 2.8 Ensure rotation for customer created CMKs is enabled (Scored)"
      readme = file("cis_v1.2.0/docs/2.8.md")
      query       = file("queries/kms/rotation_enabled_for_customer_key.sql")
    }

    check "2.9" {
      description = "AWS CIS 2.9 Ensure VPC flow logging is enabled in all VPCs (Scored)"
      readme = file("cis_v1.2.0/docs/2.9.md")
      query       = file("queries/ec2/flow_logs_enabled_in_all_vpcs.sql")
    }
}