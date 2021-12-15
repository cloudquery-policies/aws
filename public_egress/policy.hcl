policy "public-egress" {
  description = "Find all resources with ability to access internet"

  configuration {
    provider "aws" {
      version = ">= 0.8.2"
    }
  }
  view "aws_security_group_egress_rules" {
    description = "AWS API Gateway Method Settings"
    query "aws_security_group_egress_rules" {
      query = file("queries/cq_views/aws_security_group_egress_rules.sql")
    }
  }

  query "ec2-all-instances-with-routes-and-security-groups" {
    type        = "manual"
    description = "Find all ec2 instances that have unrestricted access to the internet with a wide open security group and routing"
    query       = file("queries/ec2/public_egress_sg_and_routing_instances.sql")
  }

  query "ec2-instances" {
    type        = "manual"
    description = "Find all ec2 instances that have unrestricted access to the internet via a security group"
    query       = file("queries/ec2/public_egress_sg_instances.sql")
  }
  query "lambda-functions" {
    type        = "manual"
    description = "Find all ec2 instances that have unrestricted access to the internet"
    query       = file("queries/lambda/functions_with_public_egress.sql")
  }

}
