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
      query = file("queries/aws-log-view.sql")
    }
  }

  policy "aws-cis-section-1" {
    description = "AWS CIS Section 1"

    query "1.1" {
      description = "AWS CIS 1.1 Avoid the use of 'root' account. Show used in last 30 days (Scored)"
      query =<<EOF
      SELECT account_id, password_last_used, user_name FROM aws_iam_users
      WHERE user_name = '<root_account>' AND password_last_used > (now() - '30 days'::interval)
    EOF
    }

    query "1.2" {
      description = "AWS CIS 1.2 Ensure MFA is enabled for all IAM users that have a console password (Scored)"
      query =<<EOF
      SELECT account_id, password_last_used, user_name, mfa_active FROM aws_iam_users
      WHERE password_enabled AND NOT mfa_active
    EOF
    }

    query "1.3" {
      description = "AWS CIS 1.3 Ensure credentials unused for 90 days or greater are disabled (Scored)"
      query =<<EOF
      SELECT account_id, arn, password_last_used, user_name, access_key_id, last_used FROM aws_iam_users
        JOIN aws_iam_user_access_keys on aws_iam_users.cq_id = aws_iam_user_access_keys.user_cq_id
       WHERE (password_enabled AND password_last_used < (now() - '90 days'::interval) OR
             (last_used < (now() - '90 days'::interval)))
    EOF
    }

    query "1.4" {
      description = "AWS CIS 1.4 Ensure access keys are rotated every 90 days or less"
      query =<<EOF
      SELECT account_id, arn, password_last_used, user_name, access_key_id, last_used, last_rotated FROM aws_iam_users
        JOIN aws_iam_user_access_keys on aws_iam_users.cq_id = aws_iam_user_access_keys.user_cq_id
       WHERE last_rotated < (now() - '90 days'::interval)
    EOF
    }

    query "1.5" {
      description = "AWS CIS 1.5  Ensure IAM password policy requires at least one uppercase letter"
      query =<<EOF
      SELECT account_id as resource_identifier FROM aws_iam_password_policies
       WHERE require_uppercase_characters = FALSE UNION select aws_accounts.account_id from aws_accounts left join aws_iam_password_policies on aws_iam_password_policies.account_id = aws_accounts.account_id where aws_iam_password_policies.account_id is NULL
    EOF
    }

    query "1.6" {
      description = "AWS CIS 1.6  Ensure IAM password policy requires at least one lowercase letter"
      query =<<EOF
      SELECT account_id as resource_identifier FROM aws_iam_password_policies
       WHERE require_lowercase_characters = FALSE UNION select aws_accounts.account_id from aws_accounts left join aws_iam_password_policies on aws_iam_password_policies.account_id = aws_accounts.account_id where aws_iam_password_policies.account_id is NULL
    EOF
    }

    query "1.7" {
      description = "AWS CIS 1.7  Ensure IAM password policy requires at least one symbol"
      query =<<EOF
      SELECT account_id as resource_identifier FROM aws_iam_password_policies
       WHERE require_symbols = FALSE UNION select aws_accounts.account_id from aws_accounts left join aws_iam_password_policies on aws_iam_password_policies.account_id = aws_accounts.account_id where aws_iam_password_policies.account_id is NULL
    EOF
    }

    query "1.8" {
      description = "AWS CIS 1.8  Ensure IAM password policy requires at least one number"
      query =<<EOF
      SELECT account_id as resource_identifier FROM aws_iam_password_policies
       WHERE require_numbers = FALSE UNION select aws_accounts.account_id from aws_accounts left join aws_iam_password_policies on aws_iam_password_policies.account_id = aws_accounts.account_id where aws_iam_password_policies.account_id is NULL
    EOF
    }

    query "1.9" {
      description = "AWS CIS 1.9 Ensure IAM password policy requires minimum length of 14 or greater"
      query =<<EOF
      SELECT account_id as resource_identifier FROM aws_iam_password_policies
       WHERE minimum_password_length < 14 UNION select aws_accounts.account_id from aws_accounts left join aws_iam_password_policies on aws_iam_password_policies.account_id = aws_accounts.account_id where aws_iam_password_policies.account_id is NULL
    EOF
    }

    query "1.10" {
      description = "AWS CIS 1.10 Ensure IAM password policy prevents password reuse"
      query =<<EOF
      SELECT account_id as resource_identifier FROM aws_iam_password_policies
       WHERE password_reuse_prevention is NULL or password_reuse_prevention > 24 UNION select aws_accounts.account_id from aws_accounts left join aws_iam_password_policies on aws_iam_password_policies.account_id = aws_accounts.account_id where aws_iam_password_policies.account_id is NULL
    EOF
    }

    query "1.11" {
      description = "AWS CIS 1.11 Ensure IAM password policy expires passwords within 90 days or less"
      query =<<EOF
      SELECT account_id as resource_identifier FROM aws_iam_password_policies
       WHERE max_password_age is NULL or max_password_age < 90 UNION select aws_accounts.account_id from aws_accounts left join aws_iam_password_policies on aws_iam_password_policies.account_id = aws_accounts.account_id where aws_iam_password_policies.account_id is NULL
    EOF
    }

    query "1.12" {
      description = "AWS CIS 1.12  Ensure no root account access key exists (Scored)"
      query =<<EOF
      select * from aws_iam_users
          JOIN aws_iam_user_access_keys aiuak on aws_iam_users.cq_id = aiuak.user_cq_id
      WHERE user_name = '<root>'
    EOF
    }

    query "1.13" {
      description = "AWS CIS 1.13 Ensure MFA is enabled for the 'root' account"
      query =<<EOF
      SELECT account_id, arn, password_last_used, user_name, mfa_active FROM aws_iam_users
      WHERE user_name = '<root_account>' AND NOT mfa_active
    EOF
    }

    query "1.14" {
      description = "AWS CIS 1.14 Ensure hardware MFA is enabled for the 'root' account (Scored)"
      query =<<EOF
      SELECT aiu.account_id, arn, max(password_last_used) as password_last_used FROM aws_iam_users as aiu
      LEFT JOIN aws_iam_virtual_mfa_devices ON aws_iam_virtual_mfa_devices.user_arn = aiu.arn
      WHERE aiu.user_name = '<root_account>' AND (serial_number IS NULL or aiu.mfa_active = false) group by aiu.account_id, arn
    EOF
    }

    query "1.16" {
      description = "AWS CIS 1.16 Ensure IAM policies are attached only to groups or roles (Scored)"
      query =<<EOF
      SELECT aws_iam_users.account_id, arn, user_name FROM aws_iam_users
      JOIN aws_iam_user_attached_policies aiuap on aws_iam_users.cq_id = aiuap.user_cq_id
    EOF
    }
  }

  policy "aws-cis-section-2" {
    description = "AWS CIS Section 2"

    query "2.1" {
      description = "AWS CIS 2.1 Ensure CloudTrail is enabled in all regions"
      query =<<EOF
      SELECT aws_cloudtrail_trails.account_id, arn, is_multi_region_trail, read_write_type, include_management_events FROM aws_cloudtrail_trails
      JOIN aws_cloudtrail_trail_event_selectors on aws_cloudtrail_trails.cq_id = aws_cloudtrail_trail_event_selectors.trail_cq_id
      WHERE is_multi_region_trail = FALSE OR (is_multi_region_trail = TRUE AND (read_write_type != 'All' OR include_management_events = FALSE))
    EOF
    }

    query "2.2" {
      description = "AWS CIS 2.2 Ensure CloudTrail log file validation is enabled"
      query =<<EOF
      SELECT aws_cloudtrail_trails.account_id, region, arn, log_file_validation_enabled FROM aws_cloudtrail_trails
      WHERE log_file_validation_enabled = FALSE
    EOF
    }

    query "2.4" {
      description = "AWS CIS 2.4 Ensure CloudTrail trails are integrated with CloudWatch Logs"
      query =<<EOF
      SELECT aws_cloudtrail_trails.account_id, arn, latest_cloud_watch_logs_delivery_time from aws_cloudtrail_trails
      WHERE cloud_watch_logs_log_group_arn is NULL OR latest_cloud_watch_logs_delivery_time < (now() - '1 days'::interval)
    EOF
    }

    query "2.6" {
      description = "AWS CIS 2.6 Ensure S3 bucket access logging is enabled on the CloudTrail S3 bucket"
      query =<<EOF
      SELECT aws_cloudtrail_trails.account_id, s3_bucket_name, aws_cloudtrail_trails.arn from aws_cloudtrail_trails
      JOIN aws_s3_buckets on s3_bucket_name = aws_s3_buckets.name
      WHERE logging_target_bucket is NULL OR logging_target_prefix is NULL
    EOF
    }

    query "2.7" {
      description = "AWS CIS 2.7 Ensure CloudTrail logs are encrypted at rest using KMS CMKs"
      query =<<EOF
      SELECT account_id, region, arn, kms_key_id from aws_cloudtrail_trails
      WHERE kms_key_id is NULL
    EOF
    }

    query "2.8" {
      description = "AWS CIS 2.8 Ensure rotation for customer created CMKs is enabled (Scored)"
      query =<<EOF
      SELECT account_id, region, arn FROM aws_kms_keys WHERE rotation_enabled = FALSE AND manager = 'CUSTOMER'
    EOF
    }

    query "2.9" {
      description = "AWS CIS 2.9 Ensure VPC flow logging is enabled in all VPCs (Scored)"
      query =<<EOF
      SELECT aws_ec2_vpcs.account_id, aws_ec2_vpcs.region, aws_ec2_vpcs.id FROM aws_ec2_vpcs
      LEFT JOIN aws_ec2_flow_logs ON aws_ec2_vpcs.id = aws_ec2_flow_logs.resource_id WHERE aws_ec2_flow_logs.resource_id is NULL
    EOF
    }
  }

  policy "aws-cis-section-3" {
    description = "AWS CIS Section 3"

    query "3.1" {
      description = "AWS CIS 3.1 Ensure a log metric filter and alarm exist for unauthorized API calls (Scored)"
      expect_output = true
      query =<<EOF
      SELECT account_id, region, cloud_watch_logs_log_group_arn  FROM aws_log_metric_filter_and_alarm
      WHERE pattern='{ ($.errorCode = "*UnauthorizedOperation") || ($.errorCode = "AccessDenied*") }'
    EOF
    }

    query "3.2" {
      description = "AWS CIS 3.2 Ensure a log metric filter and alarm exist for Management Console sign-in without MFA (Scored)"
      expect_output = true
      query =<<EOF
      SELECT account_id, region, cloud_watch_logs_log_group_arn  FROM aws_log_metric_filter_and_alarm
      WHERE pattern='{ ($.errorCode = "ConsoleLogin") || ($.additionalEventData.MFAUsed != "Yes")  }'
    EOF
    }

    query "3.3" {
      description = "AWS CIS 3.3  Ensure a log metric filter and alarm exist for usage of 'root' account (Score)"
      expect_output = true
      query =<<EOF
      SELECT account_id, region, cloud_watch_logs_log_group_arn  FROM aws_log_metric_filter_and_alarm
      WHERE pattern='{ $.userIdentity.type = "Root" && $.userIdentity.invokedBy NOT EXISTS && $.eventType != "AwsServiceEvent" }'
    EOF
    }

    query "3.4" {
      description = "AWS CIS 3.4 Ensure a log metric filter and alarm exist for IAM policy changes (Score)"
      expect_output = true
      query =<<EOF
      SELECT account_id, region, cloud_watch_logs_log_group_arn  FROM aws_log_metric_filter_and_alarm
      WHERE pattern='{ ($.eventName = DeleteGroupPolicy) || ($.eventName = DeleteRolePolicy) || ($.eventName = DeleteUserPolicy) || ($.eventName = PutGroupPolicy) || ($.eventName = PutRolePolicy) || ($.eventName = PutUserPolicy) || ($.eventName = CreatePolicy) || ($.eventName = DeletePolicy) || ($.eventName=CreatePolicyVersion) || ($.eventName=DeletePolicyVersion) || ($.eventName=AttachRolePolicy) || ($.eventName=DetachRolePolicy) || ($.eventName=AttachUserPolicy) || ($.eventName = DetachUserPolicy) || ($.eventName = AttachGroupPolicy) || ($.eventName = DetachGroupPolicy)}'
    EOF
    }

    query "3.5" {
      description = "AWS CIS 3.5 Ensure a log metric filter and alarm exist for CloudTrail configuration changes (Scored)"
      expect_output = true
      query =<<EOF
      SELECT account_id, region, cloud_watch_logs_log_group_arn  FROM aws_log_metric_filter_and_alarm
      WHERE pattern='{ ($.eventName = CreateTrail) || ($.eventName = UpdateTrail) || ($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName = StopLogging) }'
    EOF
    }

    query "3.6" {
      description = "AWS CIS 3.6 Ensure a log metric filter and alarm exist for AWS Management Console authentication failures (Scored)"
      expect_output = true
      query =<<EOF
      SELECT account_id, region, cloud_watch_logs_log_group_arn  FROM aws_log_metric_filter_and_alarm
      WHERE pattern='{ ($.eventName = ConsoleLogin) && ($.errorMessage = "Failed authentication") }'
    EOF
    }

    query "3.7" {
      description = "AWS CIS 3.7 Ensure a log metric filter and alarm exist for disabling or scheduled deletion of customer created CMKs (Scored)"
      expect_output = true
      query =<<EOF
      SELECT account_id, region, cloud_watch_logs_log_group_arn  FROM aws_log_metric_filter_and_alarm
      WHERE pattern='{($.eventSource = kms.amazonaws.com) && (($.eventName=DisableKey)||($.eventName=ScheduleKeyDeletion)) }"'
    EOF
    }

    query "3.8" {
      description = "AWS CIS 3.8 Ensure a log metric filter and alarm exist for S3 bucket policy changes (Scored)"
      expect_output = true
      query =<<EOF
      SELECT account_id, region, cloud_watch_logs_log_group_arn  FROM aws_log_metric_filter_and_alarm
      WHERE pattern='{ ($.eventSource = s3.amazonaws.com) && (($.eventName = PutBucketAcl) || ($.eventName = PutBucketPolicy) || ($.eventName = PutBucketCors) || ($.eventName = PutBucketLifecycle) || ($.eventName = PutBucketReplication) || ($.eventName = DeleteBucketPolicy) || ($.eventName = DeleteBucketCors) || ($.eventName = DeleteBucketLifecycle) || ($.eventName = DeleteBucketReplication)) }'
    EOF
    }

    query "3.9" {
      description = "AWS CIS 3.9 Ensure a log metric filter and alarm exist for AWS Config configuration changes (Scored)"
      expect_output = true
      query =<<EOF
      SELECT account_id, region, cloud_watch_logs_log_group_arn  FROM aws_log_metric_filter_and_alarm
      WHERE pattern='{($.eventSource = kms.amazonaws.com) && (($.eventName=DisableKey)||($.eventName=ScheduleKeyDeletion)) }"'
    EOF
    }

    query "3.10" {
      description = "AWS CIS 3.10 Ensure a log metric filter and alarm exist for security group changes (Scored)"
      expect_output = true
      query =<<EOF
      SELECT account_id, region, cloud_watch_logs_log_group_arn  FROM aws_log_metric_filter_and_alarm
      WHERE pattern='{ ($.eventName = AuthorizeSecurityGroupIngress) || ($.eventName = AuthorizeSecurityGroupEgress) || ($.eventName = RevokeSecurityGroupIngress) || ($.eventName = RevokeSecurityGroupEgress) || ($.eventName = CreateSecurityGroup) || ($.eventName = DeleteSecurityGroup) }'
    EOF
    }

    query "3.11" {
      description = "AWS CIS 3.11 Ensure a log metric filter and alarm exist for changes to Network Access Control Lists (NACL) (Scored)"
      expect_output = true
      query =<<EOF
      SELECT account_id, region, cloud_watch_logs_log_group_arn  FROM aws_log_metric_filter_and_alarm
      WHERE pattern='{ ($.eventName = CreateNetworkAcl) || ($.eventName = CreateNetworkAclEntry) || ($.eventName = DeleteNetworkAcl) || ($.eventName = DeleteNetworkAclEntry) || ($.eventName = ReplaceNetworkAclEntry) || ($.eventName = ReplaceNetworkAclAssociation) }'
    EOF
    }

    query "3.12" {
      description = "AWS CIS 3.12 Ensure a log metric filter and alarm exist for changes to network gateways (Scored)"
      expect_output = true
      query =<<EOF
      SELECT account_id, region, cloud_watch_logs_log_group_arn  FROM aws_log_metric_filter_and_alarm
      WHERE pattern='{ ($.eventName = CreateCustomerGateway) || ($.eventName = DeleteCustomerGateway) || ($.eventName = AttachInternetGateway) || ($.eventName = CreateInternetGateway) || ($.eventName = DeleteInternetGateway) || ($.eventName = DetachInternetGateway) }'
    EOF
    }

    query "3.13" {
      description = "AWS CIS 3.13 Ensure a log metric filter and alarm exist for route table changes (Scored)"
      expect_output = true
      query =<<EOF
      SELECT account_id, region, cloud_watch_logs_log_group_arn  FROM aws_log_metric_filter_and_alarm
      WHERE pattern='{ ($.eventName = CreateRoute) || ($.eventName = CreateRouteTable) || ($.eventName = ReplaceRoute) || ($.eventName = ReplaceRouteTableAssociation) || ($.eventName = DeleteRouteTable) || ($.eventName = DeleteRoute) || ($.eventName = DisassociateRouteTable) }'
    EOF
    }

    query "3.14" {
      description = "AWS CIS 3.14 Ensure a log metric filter and alarm exist for VPC changes (Scored)"
      expect_output = true
      query =<<EOF
      SELECT account_id, region, cloud_watch_logs_log_group_arn  FROM aws_log_metric_filter_and_alarm
      WHERE pattern='{ ($.eventName = CreateVpc) || ($.eventName = DeleteVpc) || ($.eventName = ModifyVpcAttribute) || ($.eventName = AcceptVpcPeeringConnection) || ($.eventName = CreateVpcPeeringConnection) || ($.eventName = DeleteVpcPeeringConnection) || ($.eventName = RejectVpcPeeringConnection) || ($.eventName = AttachClassicLinkVpc) || ($.eventName = DetachClassicLinkVpc) || ($.eventName = DisableVpcClassicLink) || ($.eventName = EnableVpcClassicLink) }'
    EOF
    }
  }

  policy "aws-cis-section-4" {
    description = "AWS CIS Section 4"

    query "4.1" {
      description = "AWS CIS 4.1 Ensure no security groups allow ingress from 0.0.0.0/0 to port 22 (Scored)"
      query = file("../queries/ec2/no_broad_public_ingress_on_port_22.sql")
    }

    query "4.2" {
      description = "AWS CIS 4.2 Ensure no security groups allow ingress from 0.0.0.0/0 to port 3389 (Scored)"
      query = file("../queries/ec2/no_broad_public_ingress_on_port_3389.sql")
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
