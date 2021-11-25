policy "cis-v1.20" {
  description = "AWS CIS V1.20 Policy"
  configuration {
    provider "aws" {
      version = ">= 0.5.0"
    }
  }

  view "aws_log_metric_filter_and_alarm" {
    description = "AWS Log Metric Filter and Alarm"
    query "aws_log_metric_filter_and_alarm_query" {
      query = file("queries/cloudwatch/log_metric_filter_and_alarm_view.sql")
    }
  }

  policy "aws-cis-section-1" {
    description = "AWS CIS Section 1"

    query "1.1" {
      description = "AWS CIS 1.1 Avoid the use of 'root' account. Show used in last 30 days (Scored)"
      query = file("queries/iam/avoid_root_usage.sql")
    }

    query "1.2" {
      description = "AWS CIS 1.2 Ensure MFA is enabled for all IAM users that have a console password (Scored)"
      query = file("queries/iam/mfa_enabled_for_console_access.sql")
    }

    query "1.3" {
      description = "AWS CIS 1.3 Ensure credentials unused for 90 days or greater are disabled (Scored)"
      query = file("queries/iam/unused_creds_disabled.sql")
    }

    query "1.4" {
      description = "AWS CIS 1.4 Ensure access keys are rotated every 90 days or less"
      query = file("queries/iam/old_access_keys.sql")
    }

    query "1.5" {
      description = "AWS CIS 1.5  Ensure IAM password policy requires at least one uppercase letter"
      query = file("queries/iam/password_policy_min_uppercase.sql")
    }

    query "1.6" {
      description = "AWS CIS 1.6  Ensure IAM password policy requires at least one lowercase letter"
      query = file("queries/iam/password_policy_min_lowercase.sql")
    }

    query "1.7" {
      description = "AWS CIS 1.7  Ensure IAM password policy requires at least one symbol"
      query = file("queries/iam/password_policy_min_one_symbol.sql")
    }

    query "1.8" {
      description = "AWS CIS 1.8  Ensure IAM password policy requires at least one number"
      query = file("queries/iam/password_policy_min_number.sql")
    }

    query "1.9" {
      description = "AWS CIS 1.9 Ensure IAM password policy requires minimum length of 14 or greater"
      query = file("queries/iam/password_policy_min_length.sql")
    }

    query "1.10" {
      description = "AWS CIS 1.10 Ensure IAM password policy prevents password reuse"
      query = file("queries/iam/password_policy_prevent_reuse.sql")
    }

    query "1.11" {
      description = "AWS CIS 1.11 Ensure IAM password policy expires passwords within 90 days or less"
      query = file("queries/iam/password_policy_prevent_reuse.sql")
    }

    query "1.12" {
      description = "AWS CIS 1.12  Ensure no root account access key exists (Scored)"
      query = file("queries/iam/root_user_no_access_keys.sql")
    }

    query "1.13" {
      description = "AWS CIS 1.13 Ensure MFA is enabled for the 'root' account"
      query = file("queries/iam/mfa_enabled_for_root.sql")
    }

    query "1.14" {
      description = "AWS CIS 1.14 Ensure hardware MFA is enabled for the 'root' account (Scored)"
      query = file("queries/iam/hardware_mfa_enabled_for_root.sql")
    }

    query "1.16" {
      description = "AWS CIS 1.16 Ensure IAM policies are attached only to groups or roles (Scored)"
      query = file("queries/iam/policies_attached_to_groups_roles.sql")
    }
  }

  policy "aws-cis-section-2" {
    description = "AWS CIS Section 2"

    query "2.1" {
      description = "AWS CIS 2.1 Ensure CloudTrail is enabled in all regions"
      query = file("queries/cloudtrail/enabled_in_all_regions.sql")
    }

    query "2.2" {
      description = "AWS CIS 2.2 Ensure CloudTrail log file validation is enabled"
      query = file("queries/cloudtrail/log_file_validation_enabled.sql")
    }

    query "2.4" {
      description = "AWS CIS 2.4 Ensure CloudTrail trails are integrated with CloudWatch Logs"
      query = file("queries/cloudtrail/integrated_with_cloudwatch_logs.sql")
    }

    query "2.6" {
      description = "AWS CIS 2.6 Ensure S3 bucket access logging is enabled on the CloudTrail S3 bucket"
      query = file("queries/cloudtrail/bucket_access_logging.sql")
    }

    query "2.7" {
      description = "AWS CIS 2.7 Ensure CloudTrail logs are encrypted at rest using KMS CMKs"
      query = file("queries/cloudtrail/logs_encrypted.sql")
    }

    query "2.8" {
      description = "AWS CIS 2.8 Ensure rotation for customer created CMKs is enabled (Scored)"
      query = file("queries/kms/rotation_enabled_for_customer_key.sql")
    }

    query "2.9" {
      description = "AWS CIS 2.9 Ensure VPC flow logging is enabled in all VPCs (Scored)"
      query = file("queries/ec2/flow_logs_enabled_in_all_vpcs.sql")
    }
  }

  policy "aws-cis-section-3" {
    description = "AWS CIS Section 3"

    query "3.1" {
      description = "AWS CIS 3.1 Ensure a log metric filter and alarm exist for unauthorized API calls (Scored)"
      expect_output = true
      query = file("queries/cloudwatch/alarm_unauthorized_api.sql")
    }

    query "3.2" {
      description = "AWS CIS 3.2 Ensure a log metric filter and alarm exist for Management Console sign-in without MFA (Scored)"
      expect_output = true
      query = file("queries/cloudwatch/alarm_unauthorized_api.sql")
    }

    query "3.3" {
      description = "AWS CIS 3.3  Ensure a log metric filter and alarm exist for usage of 'root' account (Score)"
      expect_output = true
      query = file("queries/cloudwatch/alarm_root_account.sql")
    }

    query "3.4" {
      description = "AWS CIS 3.4 Ensure a log metric filter and alarm exist for IAM policy changes (Score)"
      expect_output = true
      query = file("queries/cloudwatch/alarm_iam_policy_change.sql")
    }

    query "3.5" {
      description = "AWS CIS 3.5 Ensure a log metric filter and alarm exist for CloudTrail configuration changes (Scored)"
      expect_output = true
      query = file("queries/cloudwatch/alarm_cloudtrail_config_changes.sql")
    }

    query "3.6" {
      description = "AWS CIS 3.6 Ensure a log metric filter and alarm exist for AWS Management Console authentication failures (Scored)"
      expect_output = true
      query = file("queries/cloudwatch/alarm_console_auth_failure.sql")
    }

    query "3.7" {
      description = "AWS CIS 3.7 Ensure a log metric filter and alarm exist for disabling or scheduled deletion of customer created CMKs (Scored)"
      expect_output = true
      query = file("queries/cloudwatch/alarm_delete_customer_cmk.sql")
    }

    query "3.8" {
      description = "AWS CIS 3.8 Ensure a log metric filter and alarm exist for S3 bucket policy changes (Scored)"
      expect_output = true
      query = file("queries/cloudwatch/alarm_s3_bucket_policy_change.sql")
    }

    query "3.9" {
      description = "AWS CIS 3.9 Ensure a log metric filter and alarm exist for AWS Config configuration changes (Scored)"
      expect_output = true
      query = file("queries/cloudwatch/alarm_aws_config_changes.sql")
    }

    query "3.10" {
      description = "AWS CIS 3.10 Ensure a log metric filter and alarm exist for security group changes (Scored)"
      expect_output = true
      query = file("queries/cloudwatch/alarm_security_group_changes.sql")
    }

    query "3.11" {
      description = "AWS CIS 3.11 Ensure a log metric filter and alarm exist for changes to Network Access Control Lists (NACL) (Scored)"
      expect_output = true
      query = file("queries/cloudwatch/alarm_nacl_changes.sql")
    }

    query "3.12" {
      description = "AWS CIS 3.12 Ensure a log metric filter and alarm exist for changes to network gateways (Scored)"
      expect_output = true
      query = file("queries/cloudwatch/alarm_network_gateways.sql")
    }

    query "3.13" {
      description = "AWS CIS 3.13 Ensure a log metric filter and alarm exist for route table changes (Scored)"
      expect_output = true
      query = file("queries/cloudwatch/alarm_route_table_changes.sql")
    }

    query "3.14" {
      description = "AWS CIS 3.14 Ensure a log metric filter and alarm exist for VPC changes (Scored)"
      expect_output = true
      query = file("queries/cloudwatch/alarm_vpc_changes.sql")
    }
  }

  policy "aws-cis-section-4" {
    description = "AWS CIS Section 4"

    query "4.1" {
      description = "AWS CIS 4.1 Ensure no security groups allow ingress from 0.0.0.0/0 to port 22 (Scored)"
      query = file("queries/ec2/no_broad_public_ingress_on_port_22.sql")
    }

    query "4.2" {
      description = "AWS CIS 4.2 Ensure no security groups allow ingress from 0.0.0.0/0 to port 3389 (Scored)"
      query = file("queries/ec2/no_broad_public_ingress_on_port_3389.sql")
    }

    query "4.3" {
      description = "AWS CIS 4.3  Ensure the default security group of every VPC restricts all traffic (Scored)"
      query =<<EOF
      select account_id, region, group_name, from_port, to_port, cidr_ip from aws_ec2_security_groups
        JOIN aws_ec2_security_group_ip_permissions on aws_ec2_security_groups.cq_id = aws_ec2_security_group_ip_permissions.security_group_cq_id
        JOIN aws_ec2_security_group_ip_permission_ip_ranges on aws_ec2_security_group_ip_permissions.cq_id = aws_ec2_security_group_ip_permission_ip_ranges.security_group_ip_permission_cq_id
      WHERE group_name='default' AND cidr_ip = '0.0.0.0/0'
    EOF
    }
  }
}
