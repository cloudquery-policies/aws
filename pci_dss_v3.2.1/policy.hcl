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

    policy "autoscaling" {
        description = "checks for autoscaling"
        query "1" {
            description = "Auto Scaling groups associated with a load balancer should use health checks"
            query = "select 1;"
        }
    }

    policy "cloudtrail" {
        description = "checks for cloudtrail"
        query "1" {
            description = "CloudTrail logs should be encrypted at rest using AWS KMS keys"
            query = file("queries/cloudtrail/logs_encrypted.sql")
        }

        query "2" {
            description = "CloudTrail should be enabled"
            query = file("queries/cloudtrail/enabled_in_all_regions.sql")
        }

        query "3" {
            description = "CloudTrail log file validation should be enabled"
            query = file("queries/cloudtrail/log_file_validation_enabled.sql")
        }

        query "4" {
            description = "CloudTrail trails should be integrated with CloudWatch Logs"
            query = file("queries/cloudtrail/integrated_with_cloudwatch_logs.sql")
        }
    }

    policy "codebuild" {
        query "1" {
            description = "CodeBuild GitHub or Bitbucket source repository URLs should use OAuth"
            query = "select 1;"
        }

        query "2" {
            description = "CodeBuild project environment variables should not contain clear text credentials"
            query = "select 1;"
        }
    }

    policy "config" {
        query "1" {
            description = "AWS Config should be enabled"
            query = "select 1;"
        }
    }

    policy "cloudwatch" {
        query "1" {
            description = "A log metric filter and alarm should exist for usage of the 'root' user"
            query = file("queries/cloudwatch/alarm_root_account.sql")
        }
    }

    policy "dms" {
        query "1" {
            description = "AWS Database Migration Service replication instances should not be public"
            query = "select 1;"
        }
    }

    policy "ec2" {
        query "1" {
            description = "Amazon EBS snapshots should not be publicly restorable"
            query = "select 1;"
        }

        query "2" {
            description = "VPC default security group should prohibit inbound and outbound traffic"
            query = "select 1;"
        }

        query "3" {
            description = "Unused EC2 security groups should be removed (Retired)"
            query = "select 1;"
        }

        query "4" {
            description = "Unused EC2 EIPs should be removed"
            query = "select 1;"
        }

        query "5" {
            description = "Security groups should not allow ingress from 0.0.0.0/0 to port 22"
            query = "select 1;"
        }

        query "6" {
            description = "VPC flow logging should be enabled in all VPCs"
            query = file("queries/ec2/flow_logs_enabled_in_all_vpcs.sql")
        }
    }

    policy "elbv2" {
        query "1" {
            description = "Application Load Balancer should be configured to redirect all HTTP requests to HTTPS"
            query = "select 1;"
        }
    }

    policy "es" {
        query "1" {
            description = "Elasticsearch domains should be in a VPC"
            query = "select 1;"
        }

        query "2" {
            description = "Elasticsearch domains should have encryption at rest enabled"
            query = "select 1;"
        }
    }

    policy "guardduty" {
        query "1" {
            description = "GuardDuty should be enabled"
            query = "select 1;"
        }
    }

    policy "iam" {
        query "1" {
            description = "IAM root user access key should not exist"
            query = file("queries/iam/root_user_no_access_keys.sql")
        }

        query "2" {
            description = "IAM users should not have IAM policies attached"
            query = file("queries/iam/policies_attached_to_groups_roles.sql")
        }

        query "3" {
            description = "IAM policies should not allow full '*' administrative privileges"
            query = "select 1;"
        }

        query "4" {
            description = "Hardware MFA should be enabled for the root user"
            query = file("queries/iam/hardware_mfa_enabled_for_root.sql")
        }

        query "5" {
            description = "Virtual MFA should be enabled for the root user"
            query = file("queries/iam/mfa_enabled_for_root.sql")
        }

        query "6" {
            description = "MFA should be enabled for all IAM users"
            query = file("queries/iam/mfa_enabled_for_console_access.sql")
        }

        query "7" {
            description = "IAM user credentials should be disabled if not used within a predefined number of days"
            query = file("queries/iam/unused_creds_disabled.sql")
        }

        query "8" {
            description = "Password policies for IAM users should have strong configurations"
            query = "select 1;"
        }
    }

    policy "kms" {
        query "1" {
            description = "KMS key rotation should be enabled"
            query = "select 1;"
        }
    }

    policy "lambda" {
        query "1" {
            description = "Lambda functions should prohibit public access"
            query = "select 1;"
        }

        query "2" {
            description = "Lambda functions should be in a VPC"
            query = "select 1;"
        }
    }

    policy "rds" {
        query "1" {
            description = "RDS snapshots should prohibit public access"
            query = "select 1;"
        }

        query "2" {
            description = "RDS DB Instances should prohibit public access"
            query = "select 1;"
        }
    }

    policy "redshift" {
        query "1" {
            description = "Amazon Redshift clusters should prohibit public access"
            query = "select 1;"
        }
    }

    policy "s3" {
        query "1" {
            description = "S3 buckets should prohibit public write access"
            query = "select 1;"
        }

        query "2" {
            description = "S3 buckets should prohibit public read access"
            query = "select 1;"
        }

        query "3" {
            description = "S3 buckets should have cross-region replication enabled"
            query = "select 1;"
        }

        query "4" {
            description = "S3 buckets should have server-side encryption enabled"
            query = "select 1;"
        }

        query "5" {
            description = "S3 buckets should require requests to use Secure Socket Layer"
            query = "select 1;"
        }

        query "6" {
            description = "S3 Block Public Access setting should be enabled"
            query = "select 1;"
        }
    }

    policy "sage_maker" {
        query "1" {
            description = "Amazon SageMaker notebook instances should not have direct internet access"
            query = "select 1;"
        }
    }

    policy "ssm" {
        query "1" {
            description = "Amazon EC2 instances managed by Systems Manager should have a patch compliance status of COMPLIANT after a patch installation"
            query = "select 1;"
        }

        query "2" {
            description = "Instances managed by Systems Manager should have an association compliance status of COMPLIANT"
            query = "select 1;"
        }

        query "3" {
            description = "EC2 instances should be managed by AWS Systems Manager"
            query = "select 1;"
        }
    }
}