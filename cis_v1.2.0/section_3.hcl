policy "3" {
    name = "Section 3: Monitoring"
    description = file("cis_v1.2.0/docs/3.md")

    query "3.1" {
      name = "AWS CIS 3.1 Ensure a log metric filter and alarm exist for unauthorized API calls (Scored)"
      description = file("cis_v1.2.0/docs/3.1.md")
      expect_output = true
      query         = file("queries/cloudwatch/alarm_unauthorized_api.sql")
    }

    query "3.2" {
      name   = "AWS CIS 3.2 Ensure a log metric filter and alarm exist for Management Console sign-in without MFA (Scored)"
      description = file("cis_v1.2.0/docs/3.2.md")
      expect_output = true
      query         = file("queries/cloudwatch/alarm_unauthorized_api.sql")
    }

    query "3.3" {
      name   = "AWS CIS 3.3  Ensure a log metric filter and alarm exist for usage of 'root' account (Score)"
      description = file("cis_v1.2.0/docs/3.3.md")
      expect_output = true
      query         = file("queries/cloudwatch/alarm_root_account.sql")
    }

    query "3.4" {
      name   = "AWS CIS 3.4 Ensure a log metric filter and alarm exist for IAM policy changes (Score)"
      description = file("cis_v1.2.0/docs/3.4.md")
      expect_output = true
      query         = file("queries/cloudwatch/alarm_iam_policy_change.sql")
    }

    query "3.5" {
      name   = "AWS CIS 3.5 Ensure a log metric filter and alarm exist for CloudTrail configuration changes (Scored)"
      description = file("cis_v1.2.0/docs/3.5.md")
      expect_output = true
      query         = file("queries/cloudwatch/alarm_cloudtrail_config_changes.sql")
    }

    query "3.6" {
      name   = "AWS CIS 3.6 Ensure a log metric filter and alarm exist for AWS Management Console authentication failures (Scored)"
      description = file("cis_v1.2.0/docs/3.6.md")
      expect_output = true
      query         = file("queries/cloudwatch/alarm_console_auth_failure.sql")
    }

    query "3.7" {
      name   = "AWS CIS 3.7 Ensure a log metric filter and alarm exist for disabling or scheduled deletion of customer created CMKs (Scored)"
      description = file("cis_v1.2.0/docs/3.7.md")
      expect_output = true
      query         = file("queries/cloudwatch/alarm_delete_customer_cmk.sql")
    }

    query "3.8" {
      name   = "AWS CIS 3.8 Ensure a log metric filter and alarm exist for S3 bucket policy changes (Scored)"
      description = file("cis_v1.2.0/docs/3.8.md")
      expect_output = true
      query         = file("queries/cloudwatch/alarm_s3_bucket_policy_change.sql")
    }

    query "3.9" {
      name = "AWS CIS 3.9 Ensure a log metric filter and alarm exist for AWS Config configuration changes (Scored)"
      description = file("cis_v1.2.0/docs/3.9.md")
      expect_output = true
      query         = file("queries/cloudwatch/alarm_aws_config_changes.sql")
    }

    query "3.10" {
      name   = "AWS CIS 3.10 Ensure a log metric filter and alarm exist for security group changes (Scored)"
      description = file("cis_v1.2.0/docs/3.10.md")
      expect_output = true
      query         = file("queries/cloudwatch/alarm_security_group_changes.sql")
    }

    query "3.11" {
      name   = "AWS CIS 3.11 Ensure a log metric filter and alarm exist for changes to Network Access Control Lists (NACL) (Scored)"
      description = file("cis_v1.2.0/docs/3.11.md")
      expect_output = true
      query         = file("queries/cloudwatch/alarm_nacl_changes.sql")
    }

    query "3.12" {
      name   = "AWS CIS 3.12 Ensure a log metric filter and alarm exist for changes to network gateways (Scored)"
      description = file("cis_v1.2.0/docs/3.12.md")
      expect_output = true
      query         = file("queries/cloudwatch/alarm_network_gateways.sql")
    }

    query "3.13" {
      name   = "AWS CIS 3.13 Ensure a log metric filter and alarm exist for route table changes (Scored)"
      description = file("cis_v1.2.0/docs/3.13.md")
      expect_output = true
      query         = file("queries/cloudwatch/alarm_route_table_changes.sql")
    }

    query "3.14" {
      name   = "AWS CIS 3.14 Ensure a log metric filter and alarm exist for VPC changes (Scored)"
      description = file("cis_v1.2.0/docs/3.14.md")
      expect_output = true
      query         = file("queries/cloudwatch/alarm_vpc_changes.sql")
    }
}