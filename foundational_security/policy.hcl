policy "foundational_security" {
  title = "AWS Foundational Security Best Practices controls"
  configuration {
    provider "aws" {
      version = "~> v0.9.0"
    }
  }

  view "api_gateway_method_settings" {
    title = "AWS API Gateway Method Settings"
    query = file("queries/cq_views/api_gateway_method_settings.sql")
  }
  policy "acm" {
    source = file("foundational_security/services/acm.hcl")
  }

  policy "apigateway" {
    source = file("foundational_security/services/apigateway.hcl")
  }

  policy "autoscaling" {
    source = file("foundational_security/services/autoscaling.hcl")
  }

  policy "cloudfront" {
    source = file("foundational_security/services/cloudfront.hcl")
  }

  policy "cloudtrail" {
    source = file("foundational_security/services/cloudtrail.hcl")
  }

  policy "codebuild" {
    source = file("foundational_security/services/codebuild.hcl")
  }

  policy "config" {
    source = file("foundational_security/services/awsConfig.hcl")
  }

  policy "dms" {
    source = file("foundational_security/services/dms.hcl")
  }

  policy "dynamodb" {
    source = file("foundational_security/services/dynamodb.hcl")
  }

  policy "ec2" {
    source = file("foundational_security/services/ec2.hcl")
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
      query = file("queries/ec2/not_imdsv2_instances.sql")
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
    source = file("foundational_security/services/ecs.hcl")
  }

  policy "efs" {
    source = file("foundational_security/services/efs.hcl")
  }

  policy "elastic_beanstalk" {
    source = file("foundational_security/services/elastic_beanstalk.hcl")
  }

  policy "elb" {
    source = file("foundational_security/services/elb.hcl")
  }

  policy "elbv2" {
    source = file("foundational_security/services/elbv2.hcl")
  }

  policy "emr" {
    source = file("foundational_security/services/emr.hcl")
  }

  policy "elasticsearch" {
    source = file("foundational_security/services/elasticsearch.hcl")
  }

  policy "guardduty" {
    source = file("foundational_security/services/guardduty.hcl")
  }

  policy "iam" {
    source = file("foundational_security/services/iam.hcl")
  }

  policy "kms" {
    source = file("foundational_security/services/kms.hcl")
  }

  policy "lambda" {
    source = file("foundational_security/services/lambda.hcl")
  }

  policy "rds" {
    source = file("foundational_security/services/rds.hcl")
  }

  policy "redshift" {
    source = file("foundational_security/services/redshift.hcl")
  }

  policy "s3" {
    source = file("foundational_security/services/s3.hcl")
  }

  policy "sagemaker" {
    source = file("foundational_security/services/sagemaker.hcl")
  }

  policy "secretsmanager" {
    source = file("foundational_security/services/secretmanager.hcl")
  }

  policy "sns" {
    source = file("foundational_security/services/sns.hcl")
  }

  policy "sqs" {
    source = file("foundational_security/services/sqs.hcl")
  }

  policy "ssm" {
    source = file("foundational_security/services/ssm.hcl")
  }

  policy "waf" {
    source = file("foundational_security/services/waf.hcl")
  }
}