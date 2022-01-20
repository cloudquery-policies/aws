policy "foundational_security" {
  title = "AWS Foundational Security Best Practices controls"
  configuration {
    provider "aws" {
      version = "~> v0.10.0"
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
    source = file("foundational_security/services/awsconfig.hcl")
  }

  policy "dms" {
    source = file("foundational_security/services/dms.hcl")
  }

  policy "dynamodb" {
    source = file("foundational_security/services/dynamodb.hcl")
  }

  policy "ec2" {
    source = file("foundational_security/services/ec2.hcl")
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