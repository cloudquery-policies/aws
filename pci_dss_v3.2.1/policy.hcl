policy "pci-dss-v3.2.1" {
  description = "PCI DSS V3.2.1"
  configuration {
    provider "aws" {
      version = ">= v0.5.0"
    }
  }

  view "aws_log_metric_filter_and_alarm" {
    description = "AWS Log Metric Filter and Alarm"
    query "aws_log_metric_filter_and_alarm_query" {
      query = file("queries/cloudwatch/log_metric_filter_and_alarm_view.sql")
    }
  }

  view "aws_security_group_ingress_rules" {
    description = "Aggregates rules of security groups with ports and IPs including ipv6"
    query "1" {
      query = file("queries/cq_views/aws_security_group_ingress_rules.sql")
    }
  }

  policy "autoscaling" {
    description = "checks for autoscaling"
    query "1" {
      description = "Auto Scaling groups associated with a load balancer should use health checks"
      query       = file("queries/autoscaling/autoscaling_groups_elb_check.sql")
    }
  }

  policy "cloudtrail" {
    description = "checks for cloudtrail"
    query "1" {
      description = "CloudTrail logs should be encrypted at rest using AWS KMS keys"
      query       = file("queries/cloudtrail/logs_encrypted.sql")
    }

    query "2" {
      description = "CloudTrail should be enabled"
      query       = file("queries/cloudtrail/enabled_in_all_regions.sql")
    }

    query "3" {
      description = "CloudTrail log file validation should be enabled"
      query       = file("queries/cloudtrail/log_file_validation_enabled.sql")
    }

    query "4" {
      description = "CloudTrail trails should be integrated with CloudWatch Logs"
      query       = file("queries/cloudtrail/integrated_with_cloudwatch_logs.sql")
    }
  }

  policy "codebuild" {
    query "1" {
      description = "CodeBuild GitHub or Bitbucket source repository URLs should use OAuth"
      query       = file("queries/codebuild/check_oauth_usage_for_sources.sql")
    }

    query "2" {
      description = "CodeBuild project environment variables should not contain clear text credentials"
      query       = file("queries/codebuild/check_environment_variables.sql")
    }
  }

  policy "config" {
    query "1" {
      description = "AWS Config should be enabled"
      query       = file("queries/config/enabled_all_regions.sql")
    }
  }

  policy "cloudwatch" {
    query "1" {
      description = "A log metric filter and alarm should exist for usage of the 'root' user"
      query       = file("queries/cloudwatch/alarm_root_account.sql")
    }
  }

  policy "dms" {
    query "1" {
      description = "AWS Database Migration Service replication instances should not be public"
      query       = file("queries/dms/replication_not_public.sql")
    }
  }

  policy "ec2" {
    query "1" {
      description = "Amazon EBS snapshots should not be publicly restorable"
      query       = file("queries/ec2/ebs_snapshot_permissions_check.sql")
    }

    query "2" {
      description = "VPC default security group should prohibit inbound and outbound traffic"
      query       = file("queries/ec2/default_sg_no_access.sql")
    }

    // This control is retired.
    // query "3" {
    //     description = "Unused EC2 security groups should be removed (Retired)"
    // }

    query "4" {
      description = "Unused EC2 EIPs should be removed"
      query       = file("queries/ec2/get_unused_public_ips.sql")
    }

    query "5" {
      description = "Security groups should not allow ingress from 0.0.0.0/0 to port 22"
      query       = file("queries/ec2/no_broad_public_ingress_on_port_22.sql")
    }

    query "6" {
      description = "VPC flow logging should be enabled in all VPCs"
      query       = file("queries/ec2/flow_logs_enabled_in_all_vpcs.sql")
    }
  }

  policy "elbv2" {
    query "1" {
      description = "Application Load Balancer should be configured to redirect all HTTP requests to HTTPS"
      query       = file("queries/elb/elbv2_redirect_http_to_https.sql")
    }
  }

  policy "elasticsearch" {
    query "1" {
      description = "Elasticsearch domains should be in a VPC"
      query       = file("queries/elasticsearch/elasticsearch_domains_should_be_in_vpc.sql")
    }

    query "2" {
      description = "Elasticsearch domains should have encryption at rest enabled"
      query       = file("queries/elasticsearch/elasticsearch_domains_should_have_encryption_at_rest_enabled.sql")
    }
  }

  policy "guardduty" {
    query "1" {
      description = "GuardDuty should be enabled"
      query       = file("queries/guardduty/detector_enabled.sql")
    }
  }

  policy "iam" {
    query "1" {
      description = "IAM root user access key should not exist"
      query       = file("queries/iam/root_user_no_access_keys.sql")
    }

    query "2" {
      description = "IAM users should not have IAM policies attached"
      query       = file("queries/iam/policies_attached_to_groups_roles.sql")
    }

    query "3" {
      description = "IAM policies should not allow full '*' administrative privileges"
      query       = file("queries/iam/no_star.sql")
    }

    query "4" {
      description = "Hardware MFA should be enabled for the root user"
      query       = file("queries/iam/hardware_mfa_enabled_for_root.sql")
    }

    query "5" {
      description = "Virtual MFA should be enabled for the root user"
      query       = file("queries/iam/mfa_enabled_for_root.sql")
    }

    query "6" {
      description = "MFA should be enabled for all IAM users"
      query       = file("queries/iam/mfa_enabled_for_console_access.sql")
    }

    query "7" {
      description = "IAM user credentials should be disabled if not used within a predefined number of days"
      query       = file("queries/iam/unused_creds_disabled.sql")
    }

    query "8" {
      description = "Password policies for IAM users should have strong configurations"
      query       = file("queries/iam/password_policy_strong.sql")
    }
  }

  policy "kms" {
    query "1" {
      description = "KMS key rotation should be enabled"
      query       = file("queries/kms/rotation_enabled_for_customer_key.sql")
    }
  }

  policy "lambda" {
    query "1" {
      description = "Lambda functions should prohibit public access"
      query       = file("queries/lambda/lambda_function_prohibit_public_access.sql")
    }

    query "2" {
      description = "Lambda functions should be in a VPC"
      query       = file("queries/lambda/lambda_function_in_vpc.sql")
    }
  }

  policy "rds" {
    query "1" {
      description = "RDS snapshots should prohibit public access"
      query       = file("queries/rds/snapshots_should_prohibit_public_access.sql")
    }

    query "2" {
      description = "RDS DB Instances should prohibit public access"
      query       = file("queries/rds/rds_db_instances_should_prohibit_public_access.sql")
    }
  }

  policy "redshift" {
    query "1" {
      description = "Amazon Redshift clusters should prohibit public access"
      query       = file("queries/redshift/cluster_publicly_accessible.sql")
    }
  }

  policy "s3" {
    query "1" {
      description = "S3 buckets should prohibit public write access"
      query       = file("queries/s3/publicly_writable_buckets.sql")
    }

    query "2" {
      description = "S3 buckets should prohibit public read access"
      query       = file("queries/s3/publicly_readable_buckets.sql")
    }

    query "3" {
      description = "S3 buckets should have cross-region replication enabled"
      query       = file("queries/s3/s3_cross_region_replication.sql")
    }

    query "4" {
      description = "S3 buckets should have server-side encryption enabled"
      query       = file("queries/s3/s3_server_side_encryption_enabled.sql")
    }

    query "5" {
      description = "S3 buckets should require requests to use Secure Socket Layer"
      query       = file("queries/s3/deny_http_requests.sql")
    }

    query "6" {
      description = "S3 Block Public Access setting should be enabled"
      query       = file("queries/s3/account_level_public_access_blocks.sql")
    }
  }

  policy "sagemaker" {
    query "1" {
      description = "Amazon SageMaker notebook instances should not have direct internet access"
      query       = file("queries/sagemaker/sagemaker_notebook_instance_direct_internet_access_disabled.sql")
    }
  }

  policy "secretmanager" {
    description = "SecretManager"
    query "1" {
      description = "Secrets Manager secrets should have automatic rotation enabled"
      query       = file("queries/secretsmanager/secrets_should_have_automatic_rotation_enabled.sql")
    }
    query "2" {
      description = "Secrets Manager secrets configured with automatic rotation should rotate successfully"
      query       = file("queries/secretsmanager/secrets_configured_with_automatic_rotation_should_rotate_successfully.sql")
    }
    query "3" {
      description = "Remove unused Secrets Manager secrets"
      query       = file("queries/secretsmanager/remove_unused_secrets_manager_secrets.sql")
    }
    query "4" {
      description = "Secrets Manager secrets should be rotated within a specified number of days"
      query       = file("queries/secretsmanager/secrets_should_be_rotated_within_a_specified_number_of_days.sql")
    }
  }

  policy "ssm" {
    query "1" {
      description = "Amazon EC2 instances managed by Systems Manager should have a patch compliance status of COMPLIANT after a patch installation"
      query       = file("queries/ssm/instances_should_have_patch_compliance_status_of_compliant.sql")
    }

    query "2" {
      description = "Instances managed by Systems Manager should have an association compliance status of COMPLIANT"
      query       = file("queries/ssm/instances_should_have_association_compliance_status_of_compliant.sql")
    }

    query "3" {
      description = "EC2 instances should be managed by AWS Systems Manager"
      query       = file("queries/ssm/ec2_instances_should_be_managed_by_ssm.sql")
    }
  }

  policy "waf" {
    description = "WAF"
    query "1" {
      description = "AWS WAF Classic global web ACL logging should be enabled"
      query       = file("queries/wafv2/wafv2_web_acl_logging_should_be_enabled.sql")
    }
  }
}
