policy "public-egress" {
  title = "Find all resources with ability to access internet"

  configuration {
    provider "aws" {
      version = "~> 0.9.0"
    }
  }
  view "aws_security_group_egress_rules" {
    title = "AWS API Gateway Method Settings"
    query = file("queries/cq_views/aws_security_group_egress_rules.sql")
  }

  check "ec2-all-instances-with-routes-and-security-groups" {
    type  = "manual"
    title = "Find all ec2 instances that have unrestricted access to the internet with a wide open security group and routing"
    query = file("queries/ec2/public_egress_sg_and_routing_instances.sql")
  }

  check "ec2-instances" {
    type  = "manual"
    title = "Find all ec2 instances that have unrestricted access to the internet via a security group"
    query = file("queries/ec2/public_egress_sg_instances.sql")
  }
  check "lambda-functions" {
    type  = "manual"
    title = "Find all ec2 instances that have unrestricted access to the internet"
    query = file("queries/lambda/functions_with_public_egress.sql")
  }

}
