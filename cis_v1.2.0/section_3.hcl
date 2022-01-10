policy "3" {
  title = "Section 3: Monitoring"
  doc   = file("cis_v1.2.0/docs/3.md")

  check "3.1" {
    title         = "3.1 Ensure a log metric filter and alarm exist for unauthorized API calls (Scored)"
    doc           = file("cis_v1.2.0/docs/3.1.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_unauthorized_api.sql")
  }

  check "3.2" {
    title         = "3.2 Ensure a log metric filter and alarm exist for Management Console sign-in without MFA (Scored)"
    doc           = file("cis_v1.2.0/docs/3.2.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_unauthorized_api.sql")
  }

  check "3.3" {
    title         = "3.3  Ensure a log metric filter and alarm exist for usage of 'root' account (Score)"
    doc           = file("cis_v1.2.0/docs/3.3.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_root_account.sql")
  }

  check "3.4" {
    title         = "3.4 Ensure a log metric filter and alarm exist for IAM policy changes (Score)"
    doc           = file("cis_v1.2.0/docs/3.4.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_iam_policy_change.sql")
  }

  check "3.5" {
    title         = "3.5 Ensure a log metric filter and alarm exist for CloudTrail configuration changes (Scored)"
    doc           = file("cis_v1.2.0/docs/3.5.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_cloudtrail_config_changes.sql")
  }

  check "3.6" {
    title         = "3.6 Ensure a log metric filter and alarm exist for AWS Management Console authentication failures (Scored)"
    doc           = file("cis_v1.2.0/docs/3.6.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_console_auth_failure.sql")
  }

  check "3.7" {
    title         = "3.7 Ensure a log metric filter and alarm exist for disabling or scheduled deletion of customer created CMKs (Scored)"
    doc           = file("cis_v1.2.0/docs/3.7.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_delete_customer_cmk.sql")
  }

  check "3.8" {
    title         = "3.8 Ensure a log metric filter and alarm exist for S3 bucket policy changes (Scored)"
    doc           = file("cis_v1.2.0/docs/3.8.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_s3_bucket_policy_change.sql")
  }

  check "3.9" {
    title         = "3.9 Ensure a log metric filter and alarm exist for AWS Config configuration changes (Scored)"
    doc           = file("cis_v1.2.0/docs/3.9.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_aws_config_changes.sql")
  }

  check "3.10" {
    title         = "3.10 Ensure a log metric filter and alarm exist for security group changes (Scored)"
    doc           = file("cis_v1.2.0/docs/3.10.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_security_group_changes.sql")
  }

  check "3.11" {
    title         = "3.11 Ensure a log metric filter and alarm exist for changes to Network Access Control Lists (NACL) (Scored)"
    doc           = file("cis_v1.2.0/docs/3.11.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_nacl_changes.sql")
  }

  check "3.12" {
    title         = "3.12 Ensure a log metric filter and alarm exist for changes to network gateways (Scored)"
    doc           = file("cis_v1.2.0/docs/3.12.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_network_gateways.sql")
  }

  check "3.13" {
    title         = "3.13 Ensure a log metric filter and alarm exist for route table changes (Scored)"
    doc           = file("cis_v1.2.0/docs/3.13.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_route_table_changes.sql")
  }

  check "3.14" {
    title         = "3.14 Ensure a log metric filter and alarm exist for VPC changes (Scored)"
    doc           = file("cis_v1.2.0/docs/3.14.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_vpc_changes.sql")
  }
}