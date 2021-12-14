policy "public-egress" {
  description = "Find all resources with ability to access internet"

  configuration {
    provider "aws" {
      version = ">= 0.5.0"
    }
  }
  view "aws_security_group_egress_rules" {
    description = "AWS API Gateway Method Settings"
    query "aws_security_group_egress_rules" {
      query = file("queries/cq_views/aws_security_group_egress_rules.sql")
    }
  }

  query "ec2-instances" {
      description = "Find all ec2 instances that have unrestricted access to the internet"
      query       = file("queries/ec2/public_egress_instances.sql")
    }
  query "lambda-functions" {
      description = "Find all ec2 instances that have unrestricted access to the internet"
      query       = file("queries/lambda/public_egress_functions.sql")
    }

}
