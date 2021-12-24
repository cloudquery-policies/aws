policy "foundational_security" {
  description = "AWS Foundational Security Best Practices controls"
  configuration {
    provider "aws" {
      version = ">= v0.7.0"
    }
  }

  view "api_gateway_method_settings" {
    description = "AWS API Gateway Method Settings"
    query "api_gateway_method_settings_query" {
      query = file("queries/cq_views/api_gateway_method_settings.sql")
    }
  }

  policy "acm" {
    description = "acm controls"
    query "1" {
      description = "Imported ACM certificates should be renewed after a specified time period"
      query       = file("queries/acm/certificates_should_be_renewed.sql")
    }
  }

  policy "apigateway" {
    description = "apigateway controls"
    query "1" {
      description = "API Gateway REST and WebSocket API logging should be enabled"
      query       = file("queries/apigateway/api_gw_execution_logging_enabled.sql")
    }

    query "2" {
      description = "API Gateway REST API stages should be configured to use SSL certificates for backend authentication"
      query       = file("queries/apigateway/api_gw_ssl_enabled.sql")
    }

    query "3" {
      description = "API Gateway REST API stages should have AWS X-Ray tracing enabled"
      query       = file("queries/apigateway/api_gw_xray_enabled.sql")
    }

    query "4" {
      description = "API Gateway should be associated with an AWS WAF web ACL"
      query       = file("queries/apigateway/api_gw_associated_with_waf.sql")
    }

    query "5" {
      description = "API Gateway REST API cache data should be encrypted at rest"
      query       = file("queries/apigateway/api_gw_cache_encrypted.sql")
    }
  }

  policy "autoscaling" {
    description = "autoscaling controls"
    query "1" {
      query = file("queries/autoscaling/autoscaling_groups_elb_check.sql")
    }
  }

  policy "cloudfront" {
    description = "cloudfront controls"
    query "1" {
      description = "CloudFront distributions should have a default root object configured"
      query       = file("queries/cloudfront/default_root_object_configured.sql")
    }

    query "2" {
      description = "CloudFront distributions should have origin access identity enabled"
      query       = file("queries/cloudfront/origin_access_identity_enabled.sql")
    }

    query "3" {
      description = "CloudFront distributions should require encryption in transit"
      query       = file("queries/cloudfront/viewer_policy_https.sql")
    }

    query "4" {
      description = "CloudFront distributions should have origin failover configured"
      query       = file("queries/cloudfront/origin_failover_enabled.sql")
    }

    query "5" {
      description = "CloudFront distributions should have logging enabled"
      query       = file("queries/cloudfront/access_logs_enabled.sql")
    }

    query "6" {
      description = "CloudFront distributions should have AWS WAF enabled"
      query       = file("queries/cloudfront/associated_with_waf.sql")
    }
  }

  policy "cloudtrail" {
    description = "cloudtrail controls"
    query "1" {
      description = "CloudTrail should be enabled and configured with at least one multi-Region trail and not have management events excluded"
      query       = file("queries/cloudtrail/enabled_in_all_regions.sql")
    }

    query "2" {
      description = "CloudTrail should have encryption at rest enabled"
      query       = file("queries/cloudtrail/logs_encrypted.sql")
    }

    query "4" {
      description = "Ensure CloudTrail log file validation is enabled"
      query       = file("queries/cloudtrail/log_file_validation_enabled.sql")
    }

    query "5" {
      description = "Ensure CloudTrail trails are integrated with Amazon CloudWatch Logs"
      query       = file("queries/cloudtrail/integrated_with_cloudwatch_logs.sql")
    }
  }

  policy "codebuild" {
    description = "codebuild controls"
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
    description = "AWS config controls"
    query "1" {
      description = "AWS Config should be enabled"
      query       = file("queries/config/enabled_all_regions.sql")
    }
  }

  policy "dms" {
    description = "AWS config controls"
    query "1" {
      description = "AWS Config should be enabled"
      query       = file("queries/dms/replication_not_public.sql")
    }
  }

  policy "dynamodb" {
    description = "DynamoDB controls"
    query "1" {
      description = "DynamoDB tables should automatically scale capacity with demand"
      query       = file("queries/dynamodb/autoscale_or_ondemand.sql")
    }

    query "2" {
      description = "DynamoDB tables should have point-in-time recovery enabled"
      query       = file("queries/dynamodb/point_in_time_recovery.sql")
    }

    query "3" {
      description = "DynamoDB Accelerator (DAX) clusters should be encrypted at rest"
      query       = file("queries/dynamodb/dax_encrypted_at_rest.sql")
    }
  }

  policy "ec2" {
    description = "EC2 controls"

    view "aws_security_group_ingress_rules" {
      description = "Aggregates rules of security groups with ports and IPs including ipv6"
      query "aws_security_group_ingress_rules" {
        query = file("queries/cq_views/aws_security_group_ingress_rules.sql")
      }
    }

    query "1" {
      description = "Amazon EBS snapshots should not be public, determined by the ability to be restorable by anyone"
      query       = file("queries/ec2/ebs_snapshot_permissions_check.sql")
    }

    query "2" {
      description = "The VPC default security group should not allow inbound and outbound traffic"
      query       = file("queries/ec2/default_sg_no_access.sql")
    }

    query "3" {
      description = "Attached EBS volumes should be encrypted at rest"
      query       = file("queries/ec2/unencrypted_ebs_volumes.sql")
    }

    query "4" {
      description = "Stopped EC2 instances should be removed after a specified time period"
      query       = file("queries/ec2/stopped_more_thant_30_days_ago_instances.sql")
    }


    query "6" {
      description = "VPC flow logging should be enabled in all VPCs"
      query       = file("queries/ec2/flow_logs_enabled_in_all_vpcs.sql")
    }

    query "7" {
      description = "EBS default encryption should be enabled"
      query       = file("queries/ec2/ebs_encryption_by_default_disabled.sql")
    }

    query "8" {
      description = "EC2 instances should use IMDSv2"
      query       = file("queries/ec2/not_imdsV2_instances.sql")
    }

    query "9" {
      description = "EC2 instances should not have a public IP address"
      query       = file("queries/ec2/instances_with_public_ip.sql")
    }

    query "10" {
      description = "Amazon EC2 should be configured to use VPC endpoints that are created for the Amazon EC2 service"
      query       = file("queries/ec2/vpcs_without_ec2_endpoint.sql")
    }

    query "15" {
      description = "EC2 subnets should not automatically assign public IP addresses"
      query       = file("queries/ec2/subnets_that_assign_public_ips.sql")
    }

    query "16" {
      description = "Unused network access control lists should be removed"
      query       = file("queries/ec2/unused_acls.sql")
    }

    query "17" {
      description = "EC2 instances should not use multiple ENIs"
      query       = file("queries/ec2/instances_with_more_than_2_network_interfaces.sql")
    }

    query "18" {
      description = "Security groups should only allow unrestricted incoming traffic for authorized ports"
      query       = file("queries/ec2/security_groups_with_access_to_unauthorized_ports.sql")
    }

    query "19" {
      description = "Security groups should not allow unrestricted access to ports with high risk"
      query       = file("queries/ec2/security_groups_with_open_critical_ports.sql")
    }
  }

  policy "ecs" {
    description = "ECS controls"
    query "1" {
      description = "Amazon ECS task definitions should have secure networking modes and user definitions"
      query       = file("queries/ecs/task_definitions_secure_networking.sql")
    }

    query "2" {
      description = "Amazon ECS services should not have public IP addresses assigned to them automatically"
      query       = file("queries/ecs/ecs_services_with_public_ips.sql")
    }
  }

  policy "efs" {
    description = "EFS controls"
    query "1" {
      description = "Amazon EFS should be configured to encrypt file data at rest using AWS KMS"
      query       = "select 1;"
    }

    query "2" {
      description = "Amazon EFS volumes should be in backup plans"
      query       = "select 1;"
    }
  }

  policy "elastic_beanstalk" {
    description = "ElasticBeanstalk controls"
    query "1" {
      description = "Elastic Beanstalk environments should have enhanced health reporting enabled"
      query       = file("queries/elasticbeanstalk/advanced_health_reporting_enabled.sql")
    }

    query "2" {
      description = "Elastic Beanstalk managed platform updates should be enabled"
      query       = file("queries/elasticbeanstalk/elastic_beanstalk_managed_updates_enabled.sql")
    }
  }

  policy "elb" {
    description = "ELB controls"
    query "2" {
      description = "Classic Load Balancers with SSL/HTTPS listeners should use a certificate provided by AWS Certificate Manager"
      query       = file("queries/elb/elbv1_cert_provided_by_acm.sql")
    }

    query "3" {
      description = "Classic Load Balancer listeners should be configured with HTTPS or TLS termination"
      query       = file("queries/elb/elbv1_https_or_tls.sql")
    }

    query "4" {
      description = "Application load balancers should be configured to drop HTTP headers"
      query       = file("queries/elb/alb_drop_http_headers.sql")
    }

    query "5" {
      description = "Application and Classic Load Balancers logging should be enabled"
      query       = file("queries/elb/alb_logging_enabled.sql")
    }

    query "6" {
      description = "Application Load Balancer deletion protection should be enabled"
      query       = file("queries/elb/alb_deletion_protection_enabled.sql")
    }

    query "7" {
      description = "Classic Load Balancers should have connection draining enabled"
      query       = file("queries/elb/elbv1_conn_draining_enabled.sql")
    }

    query "8" {
      description = "Classic Load Balancers with HTTPS/SSL listeners should use a predefined security policy that has strong configuration"
      query       = file("queries/elb/elbv1_https_predefined_policy.sql")
    }
  }

  policy "elbv2" {
    description = "ELBv2 controls"
    query "1" {
      description = "Application Load Balancer should be configured to redirect all HTTP requests to HTTPS"
      query       = file("queries/elb/elbv2_redirect_http_to_https.sql")
    }
  }

  policy "emr" {
    description = "EMR controls"
    query "1" {
      description = "Amazon EMR cluster master nodes should not have public IP addresses"
      query       = file("queries/emr/emr_cluster_master_nodes_should_not_have_public_ip_addresses.sql")
    }
  }

  policy "elasticsearch" {
    description = "Elasticsearch controls"
    query "1" {
      description = "Elasticsearch domains should have encryption at rest enabled"
      query       = file("queries/elasticsearch/elasticsearch_domains_should_have_encryption_at_rest_enabled.sql")
    }

    query "2" {
      description = "Elasticsearch domains should be in a VPC"
      query       = file("queries/elasticsearch/elasticsearch_domains_should_be_in_vpc.sql")
    }

    query "3" {
      description = "Elasticsearch domains should encrypt data sent between nodes"
      query       = file("queries/elasticsearch/elasticsearch_domains_should_encrypt_data_sent_between_nodes.sql")
    }

    query "4" {
      description = "Elasticsearch domain error logging to CloudWatch Logs should be enabled"
      query       = file("queries/elasticsearch/elasticsearch_domain_error_logging_to_cloudwatch_logs_should_be_enabled.sql")
    }

    query "5" {
      description = "Elasticsearch domains should have audit logging enabled"
      query       = file("queries/elasticsearch/elasticsearch_domains_should_have_audit_logging_enabled.sql")
    }

    query "6" {
      description = "Elasticsearch domains should have at least three data nodes"
      query       = file("queries/elasticsearch/elasticsearch_domains_should_have_at_least_three_data_nodes.sql")
    }

    query "7" {
      description = "Elasticsearch domains should be configured with at least three dedicated master nodes"
      query       = file("queries/elasticsearch/elasticsearch_domains_should_be_configured_with_at_least_three_dedicated_master_nodes.sql")
    }

    query "8" {
      description = "Connections to Elasticsearch domains should be encrypted using TLS 1.2"
      query       = file("queries/elasticsearch/connections_to_elasticsearch_domains_should_be_encrypted_using_tls_1_2.sql")
    }
  }

  policy "guardduty" {
    description = "GuardDuty controls"
    query "1" {
      description = "GuardDuty should be enabled"
      query       = file("queries/guardduty/detector_enabled.sql")
    }
  }

  policy "iam" {
    description = "IAM controls"
    query "1" {
      description = "IAM policies should not allow full '*' administrative privileges"
      query       = file("queries/iam/policies_with_admin_rights.sql")
    }

    query "2" {
      description = "IAM users should not have IAM policies attached"
      query       = file("queries/iam/policies_attached_to_groups_roles.sql")
    }

    query "3" {
      description = "IAM users' access keys should be rotated every 90 days or less"
      query       = file("queries/iam/iam_access_keys_rotated_more_than_90_days.sql")
    }

    query "4" {
      description = "IAM root user access key should not exist"
      query       = file("queries/iam/root_user_no_access_keys.sql")
    }

    query "5" {
      description = "MFA should be enabled for all IAM users that have a console password"
      query       = file("queries/iam/mfa_enabled_for_console_access.sql")
    }

    query "6" {
      description = "Hardware MFA should be enabled for the root user"
      query       = file("queries/iam/hardware_mfa_enabled_for_root.sql")
    }

    query "7" {
      description = "Password policies for IAM users should have strong configurations"
      query       = file("queries/iam/password_policy_strong.sql")
    }

    query "8" {
      description = "Unused IAM user credentials should be removed"
      query       = file("queries/iam/iam_access_keys_unused_more_than_90_days.sql")
    }

    query "21" {
      description = "IAM customer managed policies that you create should not allow wildcard actions for services"
      query       = file("queries/iam/wildcard_access_policies.sql")
    }
  }

  policy "kms" {
    description = "KMS controls"
    query "1" {
      description = "IAM customer managed policies should not allow decryption and re-encryption actions on all KMS keys"
      query       = file("queries/kms/customer_policy_blocked_kms_actions.sql")
    }

    query "2" {
      description = "IAM principals should not have IAM inline policies that allow decryption and re-encryption actions on all KMS keys"
      query       = file("queries/kms/inline_policy_blocked_kms_actions.sql")
    }

    query "3" {
      description = "AWS KMS keys should not be unintentionally deleted"
      query       = file("queries/kms/cmk_not_scheduled_for_deletion.sql")
    }
  }

  policy "lambda" {
    description = "Lambda controls"
    query "1" {
      description = "Lambda function policies should prohibit public access"
      query       = file("queries/lambda/lambda_function_prohibit_public_access.sql")
    }

    query "2" {
      description = "Lambda functions should use supported runtimes"
      query       = file("queries/lambda/lambda_functions_should_use_supported_runtimes.sql")
    }
  }

  policy "rds" {
    description = "RDS controls"
    query "1" {
      description = "RDS snapshots should be private"
      query       = file("queries/rds/snapshots_should_prohibit_public_access.sql")
    }

    query "2" {
      description = "RDS DB instances should prohibit public access, determined by the PubliclyAccessible configuration"
      query       = file("queries/rds/rds_db_instances_should_prohibit_public_access.sql")
    }

    query "3" {
      description = "RDS DB instances should have encryption at rest enabled"
      query       = file("queries/rds/rds_db_instances_should_have_encryption_at_rest_enabled.sql")
    }

    query "4" {
      description = "RDS cluster snapshots and database snapshots should be encrypted at rest"
      query       = file("queries/rds/rds_cluster_snapshots_and_database_snapshots_should_be_encrypted_at_rest.sql")
    }

    query "5" {
      description = "RDS DB instances should be configured with multiple Availability Zones"
      query       = file("queries/rds/rds_db_instances_should_be_configured_with_multiple_availability_zones.sql")
    }

    query "6" {
      description = "Enhanced monitoring should be configured for RDS DB instances and clusters"
      query       = file("queries/rds/enhanced_monitoring_should_be_configured_for_rds_db_instances_and_clusters.sql")
    }

    query "7" {
      description = "RDS clusters should have deletion protection enabled"
      query       = file("queries/rds/rds_clusters_should_have_deletion_protection_enabled.sql")
    }

    query "8" {
      description = "RDS DB instances should have deletion protection enabled"
      query       = file("queries/rds/rds_db_instances_should_have_deletion_protection_enabled.sql")
    }

    query "9" {
      description = "Database logging should be enabled"
      query       = file("queries/rds/database_logging_should_be_enabled.sql")
    }

    query "10" {
      description = "IAM authentication should be configured for RDS instances"
      query       = file("queries/rds/iam_authentication_should_be_configured_for_rds_instances.sql")
    }

    query "12" {
      description = "IAM authentication should be configured for RDS clusters"
      query       = file("queries/rds/iam_authentication_should_be_configured_for_rds_clusters.sql")
    }

    query "13" {
      description = "RDS automatic minor version upgrades should be enabled"
      query       = file("queries/rds/rds_automatic_minor_version_upgrades_should_be_enabled.sql")
    }

    query "14" {
      description = "Amazon Aurora clusters should have backtracking enabled"
      query       = file("queries/rds/amazon_aurora_clusters_should_have_backtracking_enabled.sql")
    }

    query "15" {
      description = "RDS DB clusters should be configured for multiple Availability Zones"
      query       = file("queries/rds/rds_db_clusters_should_be_configured_for_multiple_availability_zones.sql")
    }

    query "16" {
      description = "RDS DB clusters should be configured to copy tags to snapshots"
      query       = file("queries/rds/rds_db_clusters_should_be_configured_to_copy_tags_to_snapshots.sql")
    }

    query "17" {
      description = "RDS DB instances should be configured to copy tags to snapshots"
      query       = file("queries/rds/rds_db_instances_should_be_configured_to_copy_tags_to_snapshots.sql")
    }

    query "18" {
      description = "RDS instances should be deployed in a VPC"
      query       = file("queries/rds/rds_instances_should_be_deployed_in_a_vpc.sql")
    }

    query "19" {
      description = "An RDS event notifications subscription should be configured for critical cluster events"
      query       = file("queries/rds/rds_event_notifications_subscription_should_be_configured_for_critical_cluster_events.sql")
    }

    query "20" {
      description = "An RDS event notifications subscription should be configured for critical database instance events"
      query       = file("queries/rds/rds_event_notifications_subscription_should_be_configured_for_critical_database_instance_events.sql")
    }

    query "21" {
      description = "An RDS event notifications subscription should be configured for critical database parameter group events"
      query       = file("queries/rds/rds_event_notifications_subscription_should_be_configured_for_critical_database_parameter_group_events.sql")
    }

    query "22" {
      description = "An RDS event notifications subscription should be configured for critical database security group events"
      query       = file("queries/rds/rds_event_notifications_subscription_should_be_configured_for_critical_database_security_group_events.sql")
    }

    query "23" {
      description = "RDS databases and clusters should not use a database engine default port"
      query       = file("queries/rds/rds_databases_and_clusters_should_not_use_a_database_engine_default_port.sql")
    }
  }

  policy "redshift" {
    description = "Redshift"

    query "1" {
      description = "Amazon Redshift clusters should prohibit public access"
      query       = file("queries/redshift/cluster_publicly_accessible.sql")
    }

    query "2" {
      description = "Connections to Amazon Redshift clusters should be encrypted in transit"
      query       = file("queries/redshift/clusters_should_be_encrypted_in_transit.sql")
    }

    query "3" {
      description = "Amazon Redshift clusters should have automatic snapshots enabled"
      query       = file("queries/redshift/clusters_should_have_automatic_snapshots_enabled.sql")
    }

    query "4" {
      description = "Amazon Redshift clusters should have audit logging enabled"
      query       = file("queries/redshift/clusters_should_have_audit_logging_enabled.sql")
    }

    query "6" {
      description = "Amazon Redshift should have automatic upgrades to major versions enabled"
      query       = file("queries/redshift/clusters_should_have_automatic_upgrades_to_major_versions_enabled.sql")
    }

    query "7" {
      description = "Amazon Redshift clusters should use enhanced VPC routing"
      query       = file("queries/redshift/clusters_should_use_enhanced_vpc_routing.sql")
    }
  }

  policy "s3" {
    description = "S3 controls"

    query "1" {
      description = "S3 Block Public Access setting should be enabled"
      query       = file("queries/s3/account_level_public_access_blocks.sql")
    }

    query "2" {
      description = "S3 buckets should prohibit public read access"
      query       = file("queries/s3/publicly_readable_buckets.sql")
    }

    query "3" {
      description = "S3 buckets should prohibit public write access"
      query       = file("queries/s3/publicly_writable_buckets.sql")
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
      description = "Amazon S3 permissions granted to other AWS accounts in bucket policies should be restricted"
      query       = file("queries/s3/restrict_cross_account_actions.sql")
    }

    query "8" {
      description = "S3 Block Public Access setting should be enabled at the bucket level"
      query       = file("queries/s3/account_level_public_access_blocks.sql")
    }
  }

  policy "sagemaker" {
    description = "SageMaker"
    query "1" {
      description = "Amazon SageMaker notebook instances should not have direct internet access"
      query       = file("queries/sagemaker/sagemaker_notebook_instance_direct_internet_access_disabled.sql")
    }
  }

  policy "secretmanager" {
    description = "SecretManager controls"
    query "1" {
      description = "Secrets Manager secrets should have automatic rotation enabled"
      query       = "select 1;"
    }
    query "2" {
      description = "Secrets Manager secrets configured with automatic rotation should rotate successfully"
      query       = "select 1;"
    }
    query "3" {
      description = "Remove unused Secrets Manager secrets"
      query       = "select 1;"
    }
    query "4" {
      description = "Secrets Manager secrets should be rotated within a specified number of days"
      query       = "select 1;"
    }
  }

  policy "sns" {
    description = "SNS"
    query "1" {
      description = "SNS topics should be encrypted at rest using AWS KMS"
      query       = file("queries/sns/sns_topics_should_be_encrypted_at_rest_using_aws_kms.sql")
    }
  }

  policy "sqs" {
    description = "SQS"
    query "1" {
      description = "SNS topics should be encrypted at rest using AWS KMS"
      query       = file("queries/sqs/sqs_queues_should_be_encrypted_at_rest_using_aws_kms.sql")
    }
  }

  policy "ssm" {
    description = "SSM controls"
    query "1" {
      description = "EC2 instances should be managed by AWS Systems Manager"
      query       = file("queries/ssm/ec2_instances_should_be_managed_by_ssm.sql")
    }
    query "2" {
      description = "All EC2 instances managed by Systems Manager should be compliant with patching requirements"
      query       = file("queries/ssm/instances_should_have_patch_compliance_status_of_compliant.sql")
    }
    query "3" {
      description = "Instances managed by Systems Manager should have an association compliance status of COMPLIANT"
      query       = file("queries/ssm/instances_should_have_association_compliance_status_of_compliant.sql")
    }
    query "4" {
      description = "SSM documents should not be public"
      query       = file("queries/ssm/documents_should_not_be_public.sql")
    }
  }

  policy "waf" {
    description = "WAF controls"
    query "1" {
      description = "AWS WAF Classic global web ACL logging should be enabled"
      query       = "select 1;"
    }
  }
}
