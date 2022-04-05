policy "pci-dss-v3.2.1" {
  title = "PCI DSS V3.2.1"
  configuration {
    provider "aws" {
      version = "~> v0.10.0"
    }
  }

  policy "autoscaling" {
    title = "checks for autoscaling"
    check "1" {
      title = "Auto Scaling groups associated with a load balancer should use health checks"
      query = file("queries/autoscaling/autoscaling_groups_elb_check.sql")
      doc   = file("pci_dss_v3.2.1/docs/autoscaling.md")
    }
  }

  policy "cloudtrail" {
    title = "checks for cloudtrail"
    check "1" {
      title = "CloudTrail logs should be encrypted at rest using AWS KMS keys"
      query = file("queries/cloudtrail/logs_encrypted.sql")
      doc   = file("pci_dss_v3.2.1/docs/cloudtrail_1.md")
    }

    check "2" {
      title = "CloudTrail should be enabled"
      query = file("queries/cloudtrail/enabled_in_all_regions.sql")
      doc   = file("pci_dss_v3.2.1/docs/cloudtrail_2.md")
    }

    check "3" {
      title = "CloudTrail log file validation should be enabled"
      query = file("queries/cloudtrail/log_file_validation_enabled.sql")
      doc   = file("pci_dss_v3.2.1/docs/cloudtrail_3.md")
    }

    check "4" {
      title = "CloudTrail trails should be integrated with CloudWatch Logs"
      query = file("queries/cloudtrail/integrated_with_cloudwatch_logs.sql")
      doc   = file("pci_dss_v3.2.1/docs/cloudtrail_4.md")
    }
  }

  policy "codebuild" {
    check "1" {
      title = "CodeBuild GitHub or Bitbucket source repository URLs should use OAuth"
      query = file("queries/codebuild/check_oauth_usage_for_sources.sql")
      doc   = file("pci_dss_v3.2.1/docs/codebuild_1.md")
    }

    check "2" {
      title = "CodeBuild project environment variables should not contain clear text credentials"
      query = file("queries/codebuild/check_environment_variables.sql")
      doc   = file("pci_dss_v3.2.1/docs/codebuild_2.md")
    }
  }

  policy "config" {
    check "1" {
      title = "AWS Config should be enabled"
      query = file("queries/config/enabled_all_regions.sql")
      doc   = file("pci_dss_v3.2.1/docs/config_1.md")
    }
  }

  policy "cloudwatch" {
    view "aws_log_metric_filter_and_alarm" {
      title = "AWS Log Metric Filter and Alarm"
      query = file("queries/cloudwatch/log_metric_filter_and_alarm_view.sql")
    }

    check "1" {
      title = "A log metric filter and alarm should exist for usage of the 'root' user"
      query = file("queries/cloudwatch/alarm_root_account.sql")
      doc   = file("pci_dss_v3.2.1/docs/cloudwatch_1.md")
    }
  }

  policy "dms" {
    check "1" {
      title = "AWS Database Migration Service replication instances should not be public"
      query = file("queries/dms/replication_not_public.sql")
      doc   = file("pci_dss_v3.2.1/docs/dms_1.md")
    }
  }

  policy "ec2" {
    view "aws_security_group_ingress_rules" {
      title = "Aggregates rules of security groups with ports and IPs including ipv6"
      query = file("queries/cq_views/aws_security_group_ingress_rules.sql")
    }

    check "1" {
      title = "Amazon EBS snapshots should not be publicly restorable"
      query = file("queries/ec2/ebs_snapshot_permissions_check.sql")
      doc   = file("pci_dss_v3.2.1/docs/ec2_1.md")
    }

    check "2" {
      title = "VPC default security group should prohibit inbound and outbound traffic"
      query = file("queries/ec2/default_sg_no_access.sql")
      doc   = file("pci_dss_v3.2.1/docs/ec2_2.md")
    }

    // This control is retired.
    // check "3" {
    //     title = "Unused EC2 security groups should be removed (Retired)"
    // }

    check "4" {
      title = "Unused EC2 EIPs should be removed"
      query = file("queries/ec2/get_unused_public_ips.sql")
      doc   = file("pci_dss_v3.2.1/docs/ec2_4.md")
    }

    check "5" {
      title = "Security groups should not allow ingress from 0.0.0.0/0 to port 22"
      query = file("queries/ec2/no_broad_public_ingress_on_port_22.sql")
      doc   = file("pci_dss_v3.2.1/docs/ec2_5.md")
    }

    check "6" {
      title = "VPC flow logging should be enabled in all VPCs"
      query = file("queries/ec2/flow_logs_enabled_in_all_vpcs.sql")
      doc   = file("pci_dss_v3.2.1/docs/ec2_6.md")
    }
  }

  policy "elbv2" {
    check "1" {
      title = "Application Load Balancer should be configured to redirect all HTTP requests to HTTPS"
      query = file("queries/elb/elbv2_redirect_http_to_https.sql")
      doc   = file("pci_dss_v3.2.1/docs/elbv2_1.md")
    }
  }

  policy "elasticsearch" {
    check "1" {
      title = "Elasticsearch domains should be in a VPC"
      query = file("queries/elasticsearch/elasticsearch_domains_should_be_in_vpc.sql")
      doc   = file("pci_dss_v3.2.1/docs/elasticsearch_1.md")
    }

    check "2" {
      title = "Elasticsearch domains should have encryption at rest enabled"
      query = file("queries/elasticsearch/elasticsearch_domains_should_have_encryption_at_rest_enabled.sql")
      doc   = file("pci_dss_v3.2.1/docs/elasticsearch_2.md")
    }
  }

  policy "guardduty" {
    check "guardduty enabled in all enabled regions" {
      title = "GuardDuty should be enabled"
      query = file("queries/guardduty/detector_enabled.sql")
      doc   = file("pci_dss_v3.2.1/docs/guardduty_1.md")
    }
  }

  policy "iam" {
    check "1" {
      title = "IAM root user access key should not exist"
      query = file("queries/iam/root_user_no_access_keys.sql")
      doc   = file("pci_dss_v3.2.1/docs/iam_1.md")
    }

    check "2" {
      title = "IAM users should not have IAM policies attached"
      query = file("queries/iam/policies_attached_to_groups_roles.sql")
      doc   = file("pci_dss_v3.2.1/docs/iam_2.md")
    }

    check "3" {
      title = "IAM policies should not allow full '*' administrative privileges"
      query = file("queries/iam/no_star.sql")
      doc   = file("pci_dss_v3.2.1/docs/iam_3.md")
    }

    check "4" {
      title = "Hardware MFA should be enabled for the root user"
      query = file("queries/iam/hardware_mfa_enabled_for_root.sql")
      doc   = file("pci_dss_v3.2.1/docs/iam_4.md")
    }

    check "5" {
      title = "Virtual MFA should be enabled for the root user"
      query = file("queries/iam/mfa_enabled_for_root.sql")
      doc   = file("pci_dss_v3.2.1/docs/iam_5.md")
    }

    check "6" {
      title = "MFA should be enabled for all IAM users"
      query = file("queries/iam/mfa_enabled_for_console_access.sql")
      doc   = file("pci_dss_v3.2.1/docs/iam_6.md")
    }

    check "7" {
      title = "IAM user credentials should be disabled if not used within a predefined number of days"
      query = file("queries/iam/unused_creds_disabled.sql")
      doc   = file("pci_dss_v3.2.1/docs/iam_7.md")
    }

    check "8" {
      title = "Password policies for IAM users should have strong configurations"
      query = file("queries/iam/password_policy_strong.sql")
      doc   = file("pci_dss_v3.2.1/docs/iam_8.md")
    }
  }

  policy "kms" {
    check "1" {
      title = "KMS key rotation should be enabled"
      query = file("queries/kms/rotation_enabled_for_customer_key.sql")
      doc   = file("pci_dss_v3.2.1/docs/kms_1.md")
    }
  }

  policy "lambda" {
    check "1" {
      title = "Lambda functions should prohibit public access"
      query = file("queries/lambda/lambda_function_prohibit_public_access.sql")
      doc   = file("pci_dss_v3.2.1/docs/lambda_1.md")
    }

    check "2" {
      title = "Lambda functions should be in a VPC"
      query = file("queries/lambda/lambda_function_in_vpc.sql")
      doc   = file("pci_dss_v3.2.1/docs/lambda_2.md")
    }
  }

  policy "rds" {
    check "1" {
      title = "RDS snapshots should prohibit public access"
      query = file("queries/rds/snapshots_should_prohibit_public_access.sql")
      doc   = file("pci_dss_v3.2.1/docs/rds_1.md")
    }

    check "2" {
      title = "RDS DB Instances should prohibit public access"
      query = file("queries/rds/rds_db_instances_should_prohibit_public_access.sql")
      doc   = file("pci_dss_v3.2.1/docs/rds_2.md")
    }
  }

  policy "redshift" {
    check "1" {
      title = "Amazon Redshift clusters should prohibit public access"
      query = file("queries/redshift/cluster_publicly_accessible.sql")
      doc   = file("pci_dss_v3.2.1/docs/redshift_1.md")
    }
  }

  policy "s3" {
    check "1" {
      title = "S3 buckets should prohibit public write access"
      query = file("queries/s3/publicly_writable_buckets.sql")
      doc   = file("pci_dss_v3.2.1/docs/s3_1.md")
    }

    check "2" {
      title = "S3 buckets should prohibit public read access"
      query = file("queries/s3/publicly_readable_buckets.sql")
      doc   = file("pci_dss_v3.2.1/docs/s3_2.md")
    }

    check "3" {
      title = "S3 buckets should have cross-region replication enabled"
      query = file("queries/s3/s3_cross_region_replication.sql")
      doc   = file("pci_dss_v3.2.1/docs/s3_3.md")
    }

    check "4" {
      title = "S3 buckets should have server-side encryption enabled"
      query = file("queries/s3/s3_server_side_encryption_enabled.sql")
      doc   = file("pci_dss_v3.2.1/docs/s3_4.md")
    }

    check "5" {
      title = "S3 buckets should require requests to use Secure Socket Layer"
      query = file("queries/s3/deny_http_requests.sql")
      doc   = file("pci_dss_v3.2.1/docs/s3_5.md")
    }

    check "6" {
      title = "S3 Block Public Access setting should be enabled"
      query = file("queries/s3/account_level_public_access_blocks.sql")
      doc   = file("pci_dss_v3.2.1/docs/s3_6.md")
    }
  }

  policy "sagemaker" {
    check "1" {
      title = "Amazon SageMaker notebook instances should not have direct internet access"
      query = file("queries/sagemaker/sagemaker_notebook_instance_direct_internet_access_disabled.sql")
      doc   = file("pci_dss_v3.2.1/docs/sagemaker_1.md")
    }
  }

  policy "secretmanager" {
    title = "SecretManager"
    check "1" {
      title = "Secrets Manager secrets should have automatic rotation enabled"
      query = file("queries/secretsmanager/secrets_should_have_automatic_rotation_enabled.sql")
    }
    check "2" {
      title = "Secrets Manager secrets configured with automatic rotation should rotate successfully"
      query = file("queries/secretsmanager/secrets_configured_with_automatic_rotation_should_rotate_successfully.sql")
    }
    check "3" {
      title = "Remove unused Secrets Manager secrets"
      query = file("queries/secretsmanager/remove_unused_secrets_manager_secrets.sql")
    }
    check "4" {
      title = "Secrets Manager secrets should be rotated within a specified number of days"
      query = file("queries/secretsmanager/secrets_should_be_rotated_within_a_specified_number_of_days.sql")
    }
  }

  policy "ssm" {
    check "1" {
      title = "Amazon EC2 instances managed by Systems Manager should have a patch compliance status of COMPLIANT after a patch installation"
      query = file("queries/ssm/instances_should_have_patch_compliance_status_of_compliant.sql")
      doc   = file("pci_dss_v3.2.1/docs/ssm_1.md")
    }

    check "2" {
      title = "Instances managed by Systems Manager should have an association compliance status of COMPLIANT"
      query = file("queries/ssm/instances_should_have_association_compliance_status_of_compliant.sql")
      doc   = file("pci_dss_v3.2.1/docs/ssm_2.md")
    }

    check "3" {
      title = "EC2 instances should be managed by AWS Systems Manager"
      query = file("queries/ssm/ec2_instances_should_be_managed_by_ssm.sql")
      doc   = file("pci_dss_v3.2.1/docs/ssm_3.md")
    }
  }

  policy "waf" {
    title = "WAF"
    check "1" {
      title = "AWS WAF Classic global web ACL logging should be enabled"
      query = file("queries/wafv2/wafv2_web_acl_logging_should_be_enabled.sql")
    }
  }
}
