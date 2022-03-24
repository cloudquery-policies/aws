policy "ec2" {
  title = "EC2 controls"
  doc   = file("foundational_security/docs/ec2.md")

  view "aws_security_group_ingress_rules" {
    title = "Aggregates rules of security groups with ports and IPs including ipv6"
    query = file("queries/cq_views/aws_security_group_ingress_rules.sql")
  }

  check "EC2.1" {
    title = "Amazon EBS snapshots should not be public, determined by the ability to be restorable by anyone"
    query = file("queries/ec2/ebs_snapshot_permissions_check.sql")
    doc   = file("foundational_security/docs/ec2.1.md")
  }

  check "EC2.2" {
    title = "The VPC default security group should not allow inbound and outbound traffic"
    query = file("queries/ec2/default_sg_no_access.sql")
    doc   = file("foundational_security/docs/ec2.2.md")
  }

  check "EC2.3" {
    title = "Attached EBS volumes should be encrypted at rest"
    query = file("queries/ec2/unencrypted_ebs_volumes.sql")
    doc   = file("foundational_security/docs/ec2.3.md")
  }

  check "EC2.4" {
    title = "Stopped EC2 instances should be removed after a specified time period"
    query = file("queries/ec2/stopped_more_thant_30_days_ago_instances.sql")
    doc   = file("foundational_security/docs/ec2.4.md")
  }


  check "EC2.6" {
    title = "VPC flow logging should be enabled in all VPCs"
    query = file("queries/ec2/flow_logs_enabled_in_all_vpcs.sql")
    doc   = file("foundational_security/docs/ec2.6.md")
  }

  check "EC2.7" {
    title = "EBS default encryption should be enabled"
    query = file("queries/ec2/ebs_encryption_by_default_disabled.sql")
    doc   = file("foundational_security/docs/ec2.7.md")
  }

  check "EC2.8" {
    title = "EC2 instances should use IMDSv2"
    query = file("queries/ec2/not_imdsv2_instances.sql")
    doc   = file("foundational_security/docs/ec2.8.md")
  }

  check "EC2.9" {
    title = "EC2 instances should not have a public IP address"
    query = file("queries/ec2/instances_with_public_ip.sql")
    doc   = file("foundational_security/docs/ec2.9.md")
  }

  check "EC2.10" {
    title = "Amazon EC2 should be configured to use VPC endpoints that are created for the Amazon EC2 service"
    query = file("queries/ec2/vpcs_without_ec2_endpoint.sql")
    doc   = file("foundational_security/docs/ec2.10.md")
  }

  check "EC2.15" {
    title = "EC2 subnets should not automatically assign public IP addresses"
    query = file("queries/ec2/subnets_that_assign_public_ips.sql")
    doc   = file("foundational_security/docs/ec2.15.md")
  }

  check "EC2.16" {
    title = "Unused network access control lists should be removed"
    query = file("queries/ec2/unused_acls.sql")
    doc   = file("foundational_security/docs/ec2.16.md")
  }

  check "EC2.17" {
    title = "EC2 instances should not use multiple ENIs"
    query = file("queries/ec2/instances_with_more_than_2_network_interfaces.sql")
    doc   = file("foundational_security/docs/ec2.17.md")
  }

  check "EC2.18" {
    title = "Security groups should only allow unrestricted incoming traffic for authorized ports"
    query = file("queries/ec2/security_groups_with_access_to_unauthorized_ports.sql")
    doc   = file("foundational_security/docs/ec2.18.md")
  }

  check "EC2.19" {
    title = "Security groups should not allow unrestricted access to ports with high risk"
    query = file("queries/ec2/security_groups_with_open_critical_ports.sql")
    doc   = file("foundational_security/docs/ec2.19.md")
  }
}