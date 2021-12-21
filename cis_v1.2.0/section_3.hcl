policy "3" {
  description = "Section 3: Monitoring"
  readme      = file("cis_v1.2.0/docs/3.md")

  check "3.1" {
    description   = "AWS CIS 3.1 Ensure a log metric filter and alarm exist for unauthorized API calls (Scored)"
    readme        = file("cis_v1.2.0/docs/3.1.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_unauthorized_api.sql")
  }

  check "3.2" {
    description   = "AWS CIS 3.2 Ensure a log metric filter and alarm exist for Management Console sign-in without MFA (Scored)"
    readme        = file("cis_v1.2.0/docs/3.2.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_unauthorized_api.sql")
  }

  check "3.3" {
    description   = "AWS CIS 3.3  Ensure a log metric filter and alarm exist for usage of 'root' account (Score)"
    readme        = file("cis_v1.2.0/docs/3.3.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_root_account.sql")
  }

  check "3.4" {
    description   = "AWS CIS 3.4 Ensure a log metric filter and alarm exist for IAM policy changes (Score)"
    readme        = file("cis_v1.2.0/docs/3.4.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_iam_policy_change.sql")
  }

  check "3.5" {
    description   = "AWS CIS 3.5 Ensure a log metric filter and alarm exist for CloudTrail configuration changes (Scored)"
    readme        = file("cis_v1.2.0/docs/3.5.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_cloudtrail_config_changes.sql")
  }

  check "3.6" {
    description   = "AWS CIS 3.6 Ensure a log metric filter and alarm exist for AWS Management Console authentication failures (Scored)"
    readme        = file("cis_v1.2.0/docs/3.6.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_console_auth_failure.sql")
  }

  check "3.7" {
    description   = "AWS CIS 3.7 Ensure a log metric filter and alarm exist for disabling or scheduled deletion of customer created CMKs (Scored)"
    readme        = file("cis_v1.2.0/docs/3.7.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_delete_customer_cmk.sql")
  }

  check "3.8" {
    description   = "AWS CIS 3.8 Ensure a log metric filter and alarm exist for S3 bucket policy changes (Scored)"
    readme        = file("cis_v1.2.0/docs/3.8.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_s3_bucket_policy_change.sql")
  }

  check "3.9" {
    description   = "AWS CIS 3.9 Ensure a log metric filter and alarm exist for AWS Config configuration changes (Scored)"
    readme        = file("cis_v1.2.0/docs/3.9.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_aws_config_changes.sql")
  }

  check "3.10" {
    description   = "AWS CIS 3.10 Ensure a log metric filter and alarm exist for security group changes (Scored)"
    readme        = file("cis_v1.2.0/docs/3.10.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_security_group_changes.sql")
  }

  check "3.11" {
    description   = "AWS CIS 3.11 Ensure a log metric filter and alarm exist for changes to Network Access Control Lists (NACL) (Scored)"
    readme        = file("cis_v1.2.0/docs/3.11.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_nacl_changes.sql")
  }

  check "3.12" {
    description   = "AWS CIS 3.12 Ensure a log metric filter and alarm exist for changes to network gateways (Scored)"
    readme        = file("cis_v1.2.0/docs/3.12.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_network_gateways.sql")
  }

  check "3.13" {
    description   = "AWS CIS 3.13 Ensure a log metric filter and alarm exist for route table changes (Scored)"
    readme        = file("cis_v1.2.0/docs/3.13.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_route_table_changes.sql")
  }

  check "3.14" {
    description   = "AWS CIS 3.14 Ensure a log metric filter and alarm exist for VPC changes (Scored)"
    readme        = file("cis_v1.2.0/docs/3.14.md")
    expect_output = true
    query         = file("queries/cloudwatch/alarm_vpc_changes.sql")
  }
}