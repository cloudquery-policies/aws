policy "pci-dss-v3.2.1" {
  title = "PCI DSS V3.2.1"
  configuration {
    provider "aws" {
      version = ">= v0.9.0"
    }
  }

  view "aws_log_metric_filter_and_alarm" {
    title = "AWS Log Metric Filter and Alarm"
    query = file("queries/cloudwatch/log_metric_filter_and_alarm_view.sql")
  }


  view "aws_security_group_ingress_rules" {
    title = "Aggregates rules of security groups with ports and IPs including ipv6"
    query = file("queries/cq_views/aws_security_group_ingress_rules.sql")
  }

  policy "autoscaling" {
    title = "checks for autoscaling"
    check "1" {
      title = "Auto Scaling groups associated with a load balancer should use health checks"
      query = file("queries/autoscaling/autoscaling_groups_elb_check.sql")
    }
  }

  policy "cloudtrail" {
    title = "checks for cloudtrail"
    check "1" {
      title = "CloudTrail logs should be encrypted at rest using AWS KMS keys"
      query = file("queries/cloudtrail/logs_encrypted.sql")
    }

    check "2" {
      title = "CloudTrail should be enabled"
      query = file("queries/cloudtrail/enabled_in_all_regions.sql")
    }

    check "3" {
      title = "CloudTrail log file validation should be enabled"
      query = file("queries/cloudtrail/log_file_validation_enabled.sql")
    }

    check "4" {
      title = "CloudTrail trails should be integrated with CloudWatch Logs"
      query = file("queries/cloudtrail/integrated_with_cloudwatch_logs.sql")
    }
  }

  policy "codebuild" {
    check "1" {
      title = "CodeBuild GitHub or Bitbucket source repository URLs should use OAuth"
      query = file("queries/codebuild/check_oauth_usage_for_sources.sql")
    }

    check "2" {
      title = "CodeBuild project environment variables should not contain clear text credentials"
      query = file("queries/codebuild/check_environment_variables.sql")
    }
  }

  policy "config" {
    check "1" {
      title = "AWS Config should be enabled"
      query = file("queries/config/enabled_all_regions.sql")
    }
  }

  policy "cloudwatch" {
    check "1" {
      title = "A log metric filter and alarm should exist for usage of the 'root' user"
      query = file("queries/cloudwatch/alarm_root_account.sql")
    }
  }

  policy "dms" {
    check "1" {
      title = "AWS Database Migration Service replication instances should not be public"
      query = file("queries/dms/replication_not_public.sql")
    }
  }

  policy "ec2" {
    check "1" {
      title = "Amazon EBS snapshots should not be publicly restorable"
      query = file("queries/ec2/ebs_snapshot_permissions_check.sql")
    }

    check "2" {
      title = "VPC default security group should prohibit inbound and outbound traffic"
      query = file("queries/ec2/default_sg_no_access.sql")
    }

    // This control is retired.
    // check "3" {
    //     title = "Unused EC2 security groups should be removed (Retired)"
    // }

    check "4" {
      title = "Unused EC2 EIPs should be removed"
      query = file("queries/ec2/get_unused_public_ips.sql")
    }

    check "5" {
      title = "Security groups should not allow ingress from 0.0.0.0/0 to port 22"
      query = file("queries/ec2/no_broad_public_ingress_on_port_22.sql")
    }

    check "6" {
      title = "VPC flow logging should be enabled in all VPCs"
      query = file("queries/ec2/flow_logs_enabled_in_all_vpcs.sql")
    }
  }

  policy "elbv2" {
    check "1" {
      title = "Application Load Balancer should be configured to redirect all HTTP requests to HTTPS"
      query = file("queries/elb/elbv2_redirect_http_to_https.sql")
    }
  }

  policy "elasticsearch" {
    check "1" {
      title = "Elasticsearch domains should be in a VPC"
      query = file("queries/elasticsearch/elasticsearch_domains_should_be_in_vpc.sql")
    }

    check "2" {
      title = "Elasticsearch domains should have encryption at rest enabled"
      query = file("queries/elasticsearch/elasticsearch_domains_should_have_encryption_at_rest_enabled.sql")
    }
  }

  policy "guardduty" {
    check "guardduty enabled in all enabled regions" {
      title = "GuardDuty should be enabled"
      query = file("queries/guardduty/detector_enabled.sql")
    }
  }

  policy "iam" {
    check "1" {
      title = "IAM root user access key should not exist"
      query = file("queries/iam/root_user_no_access_keys.sql")
    }

    check "2" {
      title = "IAM users should not have IAM policies attached"
      query = file("queries/iam/policies_attached_to_groups_roles.sql")
    }

    check "3" {
      title = "IAM policies should not allow full '*' administrative privileges"
      query = file("queries/iam/no_star.sql")
    }

    check "4" {
      title = "Hardware MFA should be enabled for the root user"
      query = file("queries/iam/hardware_mfa_enabled_for_root.sql")
    }

    check "5" {
      title = "Virtual MFA should be enabled for the root user"
      query = file("queries/iam/mfa_enabled_for_root.sql")
    }

    check "6" {
      title = "MFA should be enabled for all IAM users"
      query = file("queries/iam/mfa_enabled_for_console_access.sql")
    }

    check "7" {
      title = "IAM user credentials should be disabled if not used within a predefined number of days"
      query = file("queries/iam/unused_creds_disabled.sql")
    }

    check "8" {
      title = "Password policies for IAM users should have strong configurations"
      query = file("queries/iam/password_policy_strong.sql")
    }
  }

  policy "kms" {
    check "1" {
      title = "KMS key rotation should be enabled"
      query = file("queries/kms/rotation_enabled_for_customer_key.sql")
    }
  }

  policy "lambda" {
    check "1" {
      title = "Lambda functions should prohibit public access"
      query = file("queries/lambda/lambda_function_prohibit_public_access.sql")
    }

    check "2" {
      title = "Lambda functions should be in a VPC"
      query = file("queries/lambda/lambda_function_in_vpc.sql")
    }
  }

  policy "rds" {
    check "1" {
      title = "RDS snapshots should prohibit public access"
      query = file("queries/rds/snapshots_should_prohibit_public_access.sql")
    }

    check "2" {
      title = "RDS DB Instances should prohibit public access"
      query = file("queries/rds/rds_db_instances_should_prohibit_public_access.sql")
    }
  }

  policy "redshift" {
    check "1" {
      title = "Amazon Redshift clusters should prohibit public access"
      query = file("queries/redshift/cluster_publicly_accessible.sql")
    }
  }

  policy "s3" {
    check "1" {
      title = "S3 buckets should prohibit public write access"
      query = file("queries/s3/publicly_writable_buckets.sql")
    }

    check "2" {
      title = "S3 buckets should prohibit public read access"
      query = file("queries/s3/publicly_readable_buckets.sql")
    }

    check "3" {
      title = "S3 buckets should have cross-region replication enabled"
      query = file("queries/s3/s3_cross_region_replication.sql")
    }

    check "4" {
      title = "S3 buckets should have server-side encryption enabled"
      query = file("queries/s3/s3_server_side_encryption_enabled.sql")
    }

    check "5" {
      title = "S3 buckets should require requests to use Secure Socket Layer"
      query = file("queries/s3/deny_http_requests.sql")
    }

    check "6" {
      title = "S3 Block Public Access setting should be enabled"
      query = file("queries/s3/account_level_public_access_blocks.sql")
    }
  }

  policy "sagemaker" {
    check "1" {
      title = "Amazon SageMaker notebook instances should not have direct internet access"
      query = file("queries/sagemaker/sagemaker_notebook_instance_direct_internet_access_disabled.sql")
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
    }

    check "2" {
      title = "Instances managed by Systems Manager should have an association compliance status of COMPLIANT"
      query = file("queries/ssm/instances_should_have_association_compliance_status_of_compliant.sql")
    }

    check "3" {
      title = "EC2 instances should be managed by AWS Systems Manager"
      query = file("queries/ssm/ec2_instances_should_be_managed_by_ssm.sql")
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