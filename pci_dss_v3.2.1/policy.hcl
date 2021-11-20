policy "pci-dss-v3.2.1" {
    description = "PCI DSS V3.2.1"
    configuration {
        provider "aws" {
            version = ">= v0.5.0"
        }
    }

    policy "autoscaling" {
        description = "checks for autoscaling"
        query "1" {
            description = "Auto Scaling groups associated with a load balancer should use health checks"            
        }
    }

    policy "cloudtrail" {
        description = "checks for cloudtrail"
        query "1" {
            description = "CloudTrail logs should be encrypted at rest using AWS KMS keys"
            query =<<EOF
                select account_id, region, arn from aws_cloudtrail_trails where kms_key_id is null
            EOF
        }

        query "2" {
            description = "CloudTrail should be enabled"
            query =<<EOF
                
            EOF
        }

        query "3" {
            description = "CloudTrail log file validation should be enabled"
            query =<<EOF
                
            EOF
        }

        query "4" {
            description = "CloudTrail trails should be integrated with CloudWatch Logs"
            query =<<EOF
                
            EOF
        }
    }

    policy "codebuild" {
        query "1" {
            description = "CodeBuild GitHub or Bitbucket source repository URLs should use OAuth"
            query =<<EOF
                
            EOF
        }

        query "2" {
            description = "CodeBuild project environment variables should not contain clear text credentials"
            query =<<EOF
                
            EOF
        }
    }

    policy "config" {
        query "1" {
            description = "AWS Config should be enabled"
            query =<<EOF
                
            EOF
        }
    }

    policy "cloudwatch" {
        query "1" {
            description = "A log metric filter and alarm should exist for usage of the 'root' user"
            query =<<EOF
                
            EOF
        }
    }

    policy "dms" {
        query "1" {
            description = "AWS Database Migration Service replication instances should not be public"
            query =<<EOF
                
            EOF
        }
    }

    policy "ec2" {
        query "1" {
            description = "Amazon EBS snapshots should not be publicly restorable"
            query =<<EOF                
            EOF
        }

        query "2" {
            description = "VPC default security group should prohibit inbound and outbound traffic"
            query =<<EOF                
            EOF
        }

        query "3" {
            description = "Unused EC2 security groups should be removed (Retired)"
            query =<<EOF                
            EOF
        }

        query "4" {
            description = "Unused EC2 EIPs should be removed"
            query =<<EOF                
            EOF
        }

        query "5" {
            description = "Security groups should not allow ingress from 0.0.0.0/0 to port 22"
            query =<<EOF                
            EOF
        }

        query "6" {
            description = "VPC flow logging should be enabled in all VPCs"
            query =<<EOF                
            EOF
        }
    }

    policy "elbv2" {
        query "1" {
            description = "Application Load Balancer should be configured to redirect all HTTP requests to HTTPS"
            query =<<EOF
                
            EOF
        }
    }

    policy "es" {
        query "1" {
            description = "Elasticsearch domains should be in a VPC"
            query =<<EOF
            EOF
        }

        query "2" {
            description = "Elasticsearch domains should have encryption at rest enabled"
            query =<<EOF
            EOF
        }
    }

    policy "guardduty" {
        query "1" {
            description = "GuardDuty should be enabled"
            query =<<EOF
            EOF
        }
    }

    policy "iam" {
        query "1" {
            description = "IAM root user access key should not exist"
            query =<<EOF
            EOF
        }

        query "2" {
            description = "IAM users should not have IAM policies attached"
            query =<<EOF
            EOF
        }

        query "3" {
            description = "IAM policies should not allow full '*' administrative privileges"
            query =<<EOF
            EOF
        }

        query "4" {
            description = "Hardware MFA should be enabled for the root user"
            query =<<EOF
            EOF
        }

        query "5" {
            description = "Virtual MFA should be enabled for the root user"
            query =<<EOF
            EOF
        }

        query "6" {
            description = "MFA should be enabled for all IAM users"
            query =<<EOF
            EOF
        }

        query "7" {
            description = "IAM user credentials should be disabled if not used within a predefined number of days"
            query =<<EOF
            EOF
        }

        query "8" {
            description = "Password policies for IAM users should have strong configurations"
            query =<<EOF
            EOF
        }
    }

    policy "kms" {
        query "1" {
            description = "KMS key rotation should be enabled"
            query =<<EOF
            EOF
        }
    }

    policy "lambda" {
        query "1" {
            description = "Lambda functions should prohibit public access"
            query =<<EOF
            EOF
        }

        query "2" {
            description = "Lambda functions should be in a VPC"
            query =<<EOF
            EOF
        }
    }

    policy "rds" {
        query "1" {
            description = "RDS snapshots should prohibit public access"
            query =<<EOF
            EOF
        }

        query "2" {
            description = "RDS DB Instances should prohibit public access"
            query =<<EOF
            EOF
        }
    }

    policy "redshift" {
        query "1" {
            description = "Amazon Redshift clusters should prohibit public access"
            query =<<EOF
            EOF
        }
    }

    policy "s3" {
        query "1" {
            description = "S3 buckets should prohibit public write access"
            query =<<EOF
            EOF
        }

        query "2" {
            description = "S3 buckets should prohibit public read access"
            query =<<EOF
            EOF
        }

        query "3" {
            description = "S3 buckets should have cross-region replication enabled"
            query =<<EOF
            EOF
        }

        query "4" {
            description = "S3 buckets should have server-side encryption enabled"
            query =<<EOF
            EOF
        }

        query "5" {
            description = "S3 buckets should require requests to use Secure Socket Layer"
            query =<<EOF
            EOF
        }

        query "6" {
            description = "S3 Block Public Access setting should be enabled"
            query =<<EOF
            EOF
        }
    }

    policy "sage_maker" {
        query "1" {
            description = "Amazon SageMaker notebook instances should not have direct internet access"
            query =<<EOF
            EOF
        }
    }

    policy "ssm" {
        query "1" {
            description = "Amazon EC2 instances managed by Systems Manager should have a patch compliance status of COMPLIANT after a patch installation"
            query =<<EOF
            EOF
        }

        query "2" {
            description = "Instances managed by Systems Manager should have an association compliance status of COMPLIANT"
            query =<<EOF
            EOF
        }

        query "3" {
            description = "EC2 instances should be managed by AWS Systems Manager"
            query =<<EOF
            EOF
        }
    }
}