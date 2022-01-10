policy "foundational_security" {
  title = "AWS Foundational Security Best Practices controls"
  configuration {
    provider "aws" {
      version = ">= v0.9.0"
    }
  }

  view "api_gateway_method_settings" {
    title = "AWS API Gateway Method Settings"
    query = file("queries/cq_views/api_gateway_method_settings.sql")
  }

  policy "acm" {
    title = "acm controls"
    check "1" {
      title = "Imported ACM certificates should be renewed after a specified time period"
      query = file("queries/acm/certificates_should_be_renewed.sql")
    }
  }

  policy "apigateway" {
    title = "apigateway controls"
    check "1" {
      title = "API Gateway REST and WebSocket API logging should be enabled"
      query = file("queries/apigateway/api_gw_execution_logging_enabled.sql")
    }

    check "2" {
      title = "API Gateway REST API stages should be configured to use SSL certificates for backend authentication"
      query = file("queries/apigateway/api_gw_ssl_enabled.sql")
    }

    check "3" {
      title = "API Gateway REST API stages should have AWS X-Ray tracing enabled"
      query = file("queries/apigateway/api_gw_xray_enabled.sql")
    }

    check "4" {
      title = "API Gateway should be associated with an AWS WAF web ACL"
      query = file("queries/apigateway/api_gw_associated_with_waf.sql")
    }

    check "5" {
      title = "API Gateway REST API cache data should be encrypted at rest"
      query = file("queries/apigateway/api_gw_cache_encrypted.sql")
    }
  }

  policy "autoscaling" {
    title = "autoscaling controls"
    check "1" {
      query = file("queries/autoscaling/autoscaling_groups_elb_check.sql")
    }
  }

  policy "cloudfront" {
    title = "cloudfront controls"
    check "1" {
      title = "CloudFront distributions should have a default root object configured"
      query = file("queries/cloudfront/default_root_object_configured.sql")
    }

    check "2" {
      title = "CloudFront distributions should have origin access identity enabled"
      query = file("queries/cloudfront/origin_access_identity_enabled.sql")
    }

    check "3" {
      title = "CloudFront distributions should require encryption in transit"
      query = file("queries/cloudfront/viewer_policy_https.sql")
    }

    check "4" {
      title = "CloudFront distributions should have origin failover configured"
      query = file("queries/cloudfront/origin_failover_enabled.sql")
    }

    check "5" {
      title = "CloudFront distributions should have logging enabled"
      query = file("queries/cloudfront/access_logs_enabled.sql")
    }

    check "6" {
      title = "CloudFront distributions should have AWS WAF enabled"
      query = file("queries/cloudfront/associated_with_waf.sql")
    }
  }

  policy "cloudtrail" {
    title = "cloudtrail controls"
    check "1" {
      title = "CloudTrail should be enabled and configured with at least one multi-Region trail and not have management events excluded"
      query = file("queries/cloudtrail/enabled_in_all_regions.sql")
    }

    check "2" {
      title = "CloudTrail should have encryption at rest enabled"
      query = file("queries/cloudtrail/logs_encrypted.sql")
    }

    check "4" {
      title = "Ensure CloudTrail log file validation is enabled"
      query = file("queries/cloudtrail/log_file_validation_enabled.sql")
    }

    check "5" {
      title = "Ensure CloudTrail trails are integrated with Amazon CloudWatch Logs"
      query = file("queries/cloudtrail/integrated_with_cloudwatch_logs.sql")
    }
  }

  policy "codebuild" {
    title = "codebuild controls"
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
    title = "AWS config controls"
    check "1" {
      title = "AWS Config should be enabled"
      query = file("queries/config/enabled_all_regions.sql")
    }
  }

  policy "dms" {
    title = "AWS config controls"
    check "1" {
      title = "AWS Config should be enabled"
      query = file("queries/dms/replication_not_public.sql")
    }
  }

  policy "dynamodb" {
    title = "DynamoDB controls"
    check "1" {
      title = "DynamoDB tables should automatically scale capacity with demand"
      query = file("queries/dynamodb/autoscale_or_ondemand.sql")
    }

    check "2" {
      title = "DynamoDB tables should have point-in-time recovery enabled"
      query = file("queries/dynamodb/point_in_time_recovery.sql")
    }

    check "3" {
      title = "DynamoDB Accelerator (DAX) clusters should be encrypted at rest"
      query = file("queries/dynamodb/dax_encrypted_at_rest.sql")
    }
  }

  policy "ec2" {
    title = "EC2 controls"

    view "aws_security_group_ingress_rules" {
      title = "Aggregates rules of security groups with ports and IPs including ipv6"
      query = file("queries/cq_views/aws_security_group_ingress_rules.sql")
    }

    check "1" {
      title = "Amazon EBS snapshots should not be public, determined by the ability to be restorable by anyone"
      query = file("queries/ec2/ebs_snapshot_permissions_check.sql")
    }

    check "2" {
      title = "The VPC default security group should not allow inbound and outbound traffic"
      query = file("queries/ec2/default_sg_no_access.sql")
    }

    check "3" {
      title = "Attached EBS volumes should be encrypted at rest"
      query = file("queries/ec2/unencrypted_ebs_volumes.sql")
    }

    check "4" {
      title = "Stopped EC2 instances should be removed after a specified time period"
      query = file("queries/ec2/stopped_more_thant_30_days_ago_instances.sql")
    }


    check "6" {
      title = "VPC flow logging should be enabled in all VPCs"
      query = file("queries/ec2/flow_logs_enabled_in_all_vpcs.sql")
    }

    check "7" {
      title = "EBS default encryption should be enabled"
      query = file("queries/ec2/ebs_encryption_by_default_disabled.sql")
    }

    check "8" {
      title = "EC2 instances should use IMDSv2"
      query = file("queries/ec2/not_imdsV2_instances.sql")
    }

    check "9" {
      title = "EC2 instances should not have a public IP address"
      query = file("queries/ec2/instances_with_public_ip.sql")
    }

    check "10" {
      title = "Amazon EC2 should be configured to use VPC endpoints that are created for the Amazon EC2 service"
      query = file("queries/ec2/vpcs_without_ec2_endpoint.sql")
    }

    check "15" {
      title = "EC2 subnets should not automatically assign public IP addresses"
      query = file("queries/ec2/subnets_that_assign_public_ips.sql")
    }

    check "16" {
      title = "Unused network access control lists should be removed"
      query = file("queries/ec2/unused_acls.sql")
    }

    check "17" {
      title = "EC2 instances should not use multiple ENIs"
      query = file("queries/ec2/instances_with_more_than_2_network_interfaces.sql")
    }

    check "18" {
      title = "Security groups should only allow unrestricted incoming traffic for authorized ports"
      query = file("queries/ec2/security_groups_with_access_to_unauthorized_ports.sql")
    }

    check "19" {
      title = "Security groups should not allow unrestricted access to ports with high risk"
      query = file("queries/ec2/security_groups_with_open_critical_ports.sql")
    }
  }

  policy "ecs" {
    title = "ECS controls"
    check "1" {
      title = "Amazon ECS task definitions should have secure networking modes and user definitions"
      query = file("queries/ecs/task_definitions_secure_networking.sql")
    }

    check "2" {
      title = "Amazon ECS services should not have public IP addresses assigned to them automatically"
      query = file("queries/ecs/ecs_services_with_public_ips.sql")
    }
  }

  policy "efs" {
    title = "EFS controls"
    check "1" {
      title = "Amazon EFS should be configured to encrypt file data at rest using AWS KMS"
      query = "select 1;"
    }

    check "2" {
      title = "Amazon EFS volumes should be in backup plans"
      query = "select 1;"
    }
  }

  policy "elastic_beanstalk" {
    title = "ElasticBeanstalk controls"
    check "1" {
      title = "Elastic Beanstalk environments should have enhanced health reporting enabled"
      query = file("queries/elasticbeanstalk/advanced_health_reporting_enabled.sql")
    }

    check "2" {
      title = "Elastic Beanstalk managed platform updates should be enabled"
      query = file("queries/elasticbeanstalk/elastic_beanstalk_managed_updates_enabled.sql")
    }
  }

  policy "elb" {
    title = "ELB controls"
    check "2" {
      title = "Classic Load Balancers with SSL/HTTPS listeners should use a certificate provided by AWS Certificate Manager"
      query = file("queries/elb/elbv1_cert_provided_by_acm.sql")
    }

    check "3" {
      title = "Classic Load Balancer listeners should be configured with HTTPS or TLS termination"
      query = file("queries/elb/elbv1_https_or_tls.sql")
    }

    check "4" {
      title = "Application load balancers should be configured to drop HTTP headers"
      query = file("queries/elb/alb_drop_http_headers.sql")
    }

    check "5" {
      title = "Application and Classic Load Balancers logging should be enabled"
      query = file("queries/elb/alb_logging_enabled.sql")
    }

    check "6" {
      title = "Application Load Balancer deletion protection should be enabled"
      query = file("queries/elb/alb_deletion_protection_enabled.sql")
    }

    check "7" {
      title = "Classic Load Balancers should have connection draining enabled"
      query = file("queries/elb/elbv1_conn_draining_enabled.sql")
    }

    check "8" {
      title = "Classic Load Balancers with HTTPS/SSL listeners should use a predefined security policy that has strong configuration"
      query = file("queries/elb/elbv1_https_predefined_policy.sql")
    }
  }

  policy "elbv2" {
    title = "ELBv2 controls"
    check "1" {
      title = "Application Load Balancer should be configured to redirect all HTTP requests to HTTPS"
      query = file("queries/elb/elbv2_redirect_http_to_https.sql")
    }
  }

  policy "emr" {
    title = "EMR controls"
    check "1" {
      title = "Amazon EMR cluster master nodes should not have public IP addresses"
      query = file("queries/emr/emr_cluster_master_nodes_should_not_have_public_ip_addresses.sql")
    }
  }

  policy "elasticsearch" {
    title = "Elasticsearch controls"
    check "1" {
      title = "Elasticsearch domains should have encryption at rest enabled"
      query = file("queries/elasticsearch/elasticsearch_domains_should_have_encryption_at_rest_enabled.sql")
    }

    check "2" {
      title = "Elasticsearch domains should be in a VPC"
      query = file("queries/elasticsearch/elasticsearch_domains_should_be_in_vpc.sql")
    }

    check "3" {
      title = "Elasticsearch domains should encrypt data sent between nodes"
      query = file("queries/elasticsearch/elasticsearch_domains_should_encrypt_data_sent_between_nodes.sql")
    }

    check "4" {
      title = "Elasticsearch domain error logging to CloudWatch Logs should be enabled"
      query = file("queries/elasticsearch/elasticsearch_domain_error_logging_to_cloudwatch_logs_should_be_enabled.sql")
    }

    check "5" {
      title = "Elasticsearch domains should have audit logging enabled"
      query = file("queries/elasticsearch/elasticsearch_domains_should_have_audit_logging_enabled.sql")
    }

    check "6" {
      title = "Elasticsearch domains should have at least three data nodes"
      query = file("queries/elasticsearch/elasticsearch_domains_should_have_at_least_three_data_nodes.sql")
    }

    check "7" {
      title = "Elasticsearch domains should be configured with at least three dedicated master nodes"
      query = file("queries/elasticsearch/elasticsearch_domains_should_be_configured_with_at_least_three_dedicated_master_nodes.sql")
    }

    check "8" {
      title = "Connections to Elasticsearch domains should be encrypted using TLS 1.2"
      query = file("queries/elasticsearch/connections_to_elasticsearch_domains_should_be_encrypted_using_tls_1_2.sql")
    }
  }

  policy "guardduty" {
    title = "GuardDuty controls"
    check "1" {
      title = "GuardDuty should be enabled"
      query = file("queries/guardduty/detector_enabled.sql")
    }
  }

  policy "iam" {
    title = "IAM controls"
    check "1" {
      title = "IAM policies should not allow full '*' administrative privileges"
      query = file("queries/iam/policies_with_admin_rights.sql")
    }

    check "2" {
      title = "IAM users should not have IAM policies attached"
      query = file("queries/iam/policies_attached_to_groups_roles.sql")
    }

    check "3" {
      title = "IAM users' access keys should be rotated every 90 days or less"
      query = file("queries/iam/iam_access_keys_rotated_more_than_90_days.sql")
    }

    check "4" {
      title = "IAM root user access key should not exist"
      query = file("queries/iam/root_user_no_access_keys.sql")
    }

    check "5" {
      title = "MFA should be enabled for all IAM users that have a console password"
      query = file("queries/iam/mfa_enabled_for_console_access.sql")
    }

    check "6" {
      title = "Hardware MFA should be enabled for the root user"
      query = file("queries/iam/hardware_mfa_enabled_for_root.sql")
    }

    check "7" {
      title = "Password policies for IAM users should have strong configurations"
      query = file("queries/iam/password_policy_strong.sql")
    }

    check "8" {
      title = "Unused IAM user credentials should be removed"
      query = file("queries/iam/iam_access_keys_unused_more_than_90_days.sql")
    }

    check "21" {
      title = "IAM customer managed policies that you create should not allow wildcard actions for services"
      query = file("queries/iam/wildcard_access_policies.sql")
    }
  }

  policy "kms" {
    title = "KMS controls"
    check "1" {
      title = "IAM customer managed policies should not allow decryption and re-encryption actions on all KMS keys"
      query = file("queries/kms/customer_policy_blocked_kms_actions.sql")
    }

    check "2" {
      title = "IAM principals should not have IAM inline policies that allow decryption and re-encryption actions on all KMS keys"
      query = file("queries/kms/inline_policy_blocked_kms_actions.sql")
    }

    check "3" {
      title = "AWS KMS keys should not be unintentionally deleted"
      query = file("queries/kms/cmk_not_scheduled_for_deletion.sql")
    }
  }

  policy "lambda" {
    title = "Lambda controls"
    check "1" {
      title = "Lambda function policies should prohibit public access"
      query = file("queries/lambda/lambda_function_prohibit_public_access.sql")
    }

    check "2" {
      title = "Lambda functions should use supported runtimes"
      query = file("queries/lambda/lambda_functions_should_use_supported_runtimes.sql")
    }
  }

  policy "rds" {
    title = "RDS controls"
    check "1" {
      title = "RDS snapshots should be private"
      query = file("queries/rds/snapshots_should_prohibit_public_access.sql")
    }

    check "2" {
      title = "RDS DB instances should prohibit public access, determined by the PubliclyAccessible configuration"
      query = file("queries/rds/rds_db_instances_should_prohibit_public_access.sql")
    }

    check "3" {
      title = "RDS DB instances should have encryption at rest enabled"
      query = file("queries/rds/rds_db_instances_should_have_encryption_at_rest_enabled.sql")
    }

    check "4" {
      title = "RDS cluster snapshots and database snapshots should be encrypted at rest"
      query = file("queries/rds/rds_cluster_snapshots_and_database_snapshots_should_be_encrypted_at_rest.sql")
    }

    check "5" {
      title = "RDS DB instances should be configured with multiple Availability Zones"
      query = file("queries/rds/rds_db_instances_should_be_configured_with_multiple_availability_zones.sql")
    }

    check "6" {
      title = "Enhanced monitoring should be configured for RDS DB instances and clusters"
      query = file("queries/rds/enhanced_monitoring_should_be_configured_for_rds_db_instances_and_clusters.sql")
    }

    check "7" {
      title = "RDS clusters should have deletion protection enabled"
      query = file("queries/rds/rds_clusters_should_have_deletion_protection_enabled.sql")
    }

    check "8" {
      title = "RDS DB instances should have deletion protection enabled"
      query = file("queries/rds/rds_db_instances_should_have_deletion_protection_enabled.sql")
    }

    check "9" {
      title = "Database logging should be enabled"
      query = file("queries/rds/database_logging_should_be_enabled.sql")
    }

    check "10" {
      title = "IAM authentication should be configured for RDS instances"
      query = file("queries/rds/iam_authentication_should_be_configured_for_rds_instances.sql")
    }

    check "12" {
      title = "IAM authentication should be configured for RDS clusters"
      query = file("queries/rds/iam_authentication_should_be_configured_for_rds_clusters.sql")
    }

    check "13" {
      title = "RDS automatic minor version upgrades should be enabled"
      query = file("queries/rds/rds_automatic_minor_version_upgrades_should_be_enabled.sql")
    }

    check "14" {
      title = "Amazon Aurora clusters should have backtracking enabled"
      query = file("queries/rds/amazon_aurora_clusters_should_have_backtracking_enabled.sql")
    }

    check "15" {
      title = "RDS DB clusters should be configured for multiple Availability Zones"
      query = file("queries/rds/rds_db_clusters_should_be_configured_for_multiple_availability_zones.sql")
    }

    check "16" {
      title = "RDS DB clusters should be configured to copy tags to snapshots"
      query = file("queries/rds/rds_db_clusters_should_be_configured_to_copy_tags_to_snapshots.sql")
    }

    check "17" {
      title = "RDS DB instances should be configured to copy tags to snapshots"
      query = file("queries/rds/rds_db_instances_should_be_configured_to_copy_tags_to_snapshots.sql")
    }

    check "18" {
      title = "RDS instances should be deployed in a VPC"
      query = file("queries/rds/rds_instances_should_be_deployed_in_a_vpc.sql")
    }

    check "19" {
      title = "An RDS event notifications subscription should be configured for critical cluster events"
      query = file("queries/rds/rds_event_notifications_subscription_should_be_configured_for_critical_cluster_events.sql")
    }

    check "20" {
      title = "An RDS event notifications subscription should be configured for critical database instance events"
      query = file("queries/rds/rds_event_notifications_subscription_should_be_configured_for_critical_database_instance_events.sql")
    }

    check "21" {
      title = "An RDS event notifications subscription should be configured for critical database parameter group events"
      query = file("queries/rds/rds_event_notifications_subscription_should_be_configured_for_critical_database_parameter_group_events.sql")
    }

    check "22" {
      title = "An RDS event notifications subscription should be configured for critical database security group events"
      query = file("queries/rds/rds_event_notifications_subscription_should_be_configured_for_critical_database_security_group_events.sql")
    }

    check "23" {
      title = "RDS databases and clusters should not use a database engine default port"
      query = file("queries/rds/rds_databases_and_clusters_should_not_use_a_database_engine_default_port.sql")
    }
  }

  policy "redshift" {
    title = "Redshift"

    check "1" {
      title = "Amazon Redshift clusters should prohibit public access"
      query = file("queries/redshift/cluster_publicly_accessible.sql")
    }

    check "2" {
      title = "Connections to Amazon Redshift clusters should be encrypted in transit"
      query = file("queries/redshift/clusters_should_be_encrypted_in_transit.sql")
    }

    check "3" {
      title = "Amazon Redshift clusters should have automatic snapshots enabled"
      query = file("queries/redshift/clusters_should_have_automatic_snapshots_enabled.sql")
    }

    check "4" {
      title = "Amazon Redshift clusters should have audit logging enabled"
      query = file("queries/redshift/clusters_should_have_audit_logging_enabled.sql")
    }

    check "6" {
      title = "Amazon Redshift should have automatic upgrades to major versions enabled"
      query = file("queries/redshift/clusters_should_have_automatic_upgrades_to_major_versions_enabled.sql")
    }

    check "7" {
      title = "Amazon Redshift clusters should use enhanced VPC routing"
      query = file("queries/redshift/clusters_should_use_enhanced_vpc_routing.sql")
    }
  }

  policy "s3" {
    title = "S3 controls"

    check "1" {
      title = "S3 Block Public Access setting should be enabled"
      query = file("queries/s3/account_level_public_access_blocks.sql")
    }

    check "2" {
      title = "S3 buckets should prohibit public read access"
      query = file("queries/s3/publicly_readable_buckets.sql")
    }

    check "3" {
      title = "S3 buckets should prohibit public write access"
      query = file("queries/s3/publicly_writable_buckets.sql")
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
      title = "Amazon S3 permissions granted to other AWS accounts in bucket policies should be restricted"
      query = file("queries/s3/restrict_cross_account_actions.sql")
    }

    check "8" {
      title = "S3 Block Public Access setting should be enabled at the bucket level"
      query = file("queries/s3/account_level_public_access_blocks.sql")
    }
  }

  policy "sagemaker" {
    title = "SageMaker"
    check "1" {
      title = "Amazon SageMaker notebook instances should not have direct internet access"
      query = file("queries/sagemaker/sagemaker_notebook_instance_direct_internet_access_disabled.sql")
    }
  }

  policy "secretmanager" {
    title = "SecretManager controls"
    check "1" {
      title = "Secrets Manager secrets should have automatic rotation enabled"
      query = "select 1;"
    }
    check "2" {
      title = "Secrets Manager secrets configured with automatic rotation should rotate successfully"
      query = "select 1;"
    }
    check "3" {
      title = "Remove unused Secrets Manager secrets"
      query = "select 1;"
    }
    check "4" {
      title = "Secrets Manager secrets should be rotated within a specified number of days"
      query = "select 1;"
    }
  }

  policy "sns" {
    title = "SNS"
    check "1" {
      title = "SNS topics should be encrypted at rest using AWS KMS"
      query = file("queries/sns/sns_topics_should_be_encrypted_at_rest_using_aws_kms.sql")
    }
  }

  policy "sqs" {
    title = "SQS"
    check "1" {
      title = "SNS topics should be encrypted at rest using AWS KMS"
      query = file("queries/sqs/sqs_queues_should_be_encrypted_at_rest_using_aws_kms.sql")
    }
  }

  policy "ssm" {
    title = "SSM controls"
    check "1" {
      title = "EC2 instances should be managed by AWS Systems Manager"
      query = file("queries/ssm/ec2_instances_should_be_managed_by_ssm.sql")
    }
    check "2" {
      title = "All EC2 instances managed by Systems Manager should be compliant with patching requirements"
      query = file("queries/ssm/instances_should_have_patch_compliance_status_of_compliant.sql")
    }
    check "3" {
      title = "Instances managed by Systems Manager should have an association compliance status of COMPLIANT"
      query = file("queries/ssm/instances_should_have_association_compliance_status_of_compliant.sql")
    }
    check "4" {
      title = "SSM documents should not be public"
      query = file("queries/ssm/documents_should_not_be_public.sql")
    }
  }

  policy "waf" {
    title = "WAF controls"
    check "1" {
      title = "AWS WAF Classic global web ACL logging should be enabled"
      query = "select 1;"
    }
  }
}
