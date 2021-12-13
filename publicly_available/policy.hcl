policy "public-ips" {
  description = "Find all resources with public IPs"

  configuration {
    provider "aws" {
      version = ">= 0.5.0"
    }
  }

  policy "public-ips" {
    query "API-Gateways" {
      description = "Find all API Gateway instances that are publically accessible"
      type        = "manual"

      query = <<EOF
      SELECT account_id,region,name FROM aws_apigateway_rest_apis WHERE NOT '{PRIVATE}' = endpoint_configuration_types;
    EOF
    }

    query "API-Gateway-V2" {
      description = "Find all API Gateway V2 instances (HTTP and Webhook) that are publically accessible"
      type        = "manual"

      query = <<EOF
      SELECT account_id,region,api_endpoint FROM aws_apigatewayv2_apis;
    EOF
    }

    query "CloudFront-Distributions" {
      description = "Find all Cloudfront distributions"
      type        = "manual"
      query       = <<EOF
        SELECT distinct domain_name,  account_id, arn FROM aws_cloudfront_distributions
    EOF
    }

    query "EC2-Public-Ips" {
      description = "Find all instances with a public IP address"
      type        = "manual"
      query       = <<EOF
        SELECT DISTINCT id, public_dns_name, public_ip_address, account_id, region FROM aws_ec2_instances WHERE public_ip_address IS NOT NULL
    EOF
    }

    query "ELB-Classic" {
      description = "Find all Classic ELBs that are Internet Facing"
      type        = "manual"

      query = <<EOF
        SELECT distinct region, account_id, name FROM aws_elbv1_load_balancers  WHERE scheme = 'internet-facing';
    EOF
    }

    query "ELB-V2" {
      description = "Find all ELB V2s that are Internet Facing"
      type        = "manual"

      query = <<EOF
        SELECT distinct name,  dns_name,  account_id,  region FROM aws_elbv2_load_balancers WHERE scheme = 'internet-facing';
    EOF
    }

    query "Redshift" {
      description = "Find all Redshift Clusters are publically accessible"
      type        = "manual"

      query = <<EOF
      SELECT distinct id, endpoint_address, account_id, region FROM aws_redshift_clusters WHERE publicly_accessible IS NOT NULL
  EOF
    }

    query "RDS" {
      description = "Find all RDS Instances are publically accessible"
      type        = "manual"

      query = <<EOF
      SELECT DISTINCT id, endpoint_address, account_id, region FROM aws_rds_instances WHERE publicly_accessible IS NOT NULL
  EOF
    }
  }
}
