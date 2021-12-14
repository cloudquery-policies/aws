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

  query "ec-instances" {
      description = "Amazon Redshift clusters should prohibit public access"
      query       = file("queries/redshift/cluster_publicly_accessible.sql")
    }

}
