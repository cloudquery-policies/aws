policy "public-ips" {
  title = "Find all resources with public IPs"

  configuration {
    provider "aws" {
      version = "~> 0.10.0"
    }
  }

  policy "public-ips" {
    check "API-Gateways" {
      title = "Find all API Gateway instances that are publicly accessible"
      type  = "manual"

      query = <<EOF
      SELECT account_id,region,name FROM aws_apigateway_rest_apis WHERE NOT '{PRIVATE}' = endpoint_configuration_types;
    EOF
    }

    check "API-Gateway-V2" {
      title = "Find all API Gateway V2 instances (HTTP and Webhook) that are publicly accessible"
      type  = "manual"

      query = <<EOF
      SELECT account_id,region,api_endpoint FROM aws_apigatewayv2_apis;
    EOF
    }

    check "CloudFront-Distributions" {
      title = "Find all Cloudfront distributions"
      type  = "manual"
      query = <<EOF
        SELECT distinct domain_name,  account_id, arn FROM aws_cloudfront_distributions
    EOF
    }

    check "EC2-Public-Ips" {
      title = "Find all instances with a public IP address"
      type  = "manual"
      query = <<EOF
        SELECT DISTINCT id, public_dns_name, public_ip_address, account_id, region FROM aws_ec2_instances WHERE public_ip_address IS NOT NULL
    EOF
    }

    check "ELB-Classic" {
      title = "Find all Classic ELBs that are Internet Facing"
      type  = "manual"

      query = <<EOF
        SELECT distinct region, account_id, name FROM aws_elbv1_load_balancers  WHERE scheme = 'internet-facing';
    EOF
    }

    check "ELB-V2" {
      title = "Find all ELB V2s that are Internet Facing"
      type  = "manual"

      query = <<EOF
        SELECT distinct name,  dns_name,  account_id,  region FROM aws_elbv2_load_balancers WHERE scheme = 'internet-facing';
    EOF
    }

    check "Redshift" {
      title = "Find all Redshift Clusters are publicly accessible"
      type  = "manual"

      query = <<EOF
      SELECT distinct id, endpoint_address, account_id, region FROM aws_redshift_clusters WHERE publicly_accessible IS NOT NULL
  EOF
    }

    check "RDS" {
      title = "Find all RDS Instances are publicly accessible"
      type  = "manual"

      query = <<EOF
      SELECT DISTINCT id, endpoint_address, account_id, region FROM aws_rds_instances WHERE publicly_accessible IS NOT NULL
  EOF
    }
  }
}
