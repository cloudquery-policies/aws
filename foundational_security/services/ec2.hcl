policy "ec2" {
    title = "EC2 controls"

    view "aws_security_group_ingress_rules" {
      title = "Aggregates rules of security groups with ports and IPs including ipv6"
      query = file("queries/cq_views/aws_security_group_ingress_rules.sql")
    }

    check "1" {
      title = "Amazon EBS snapshots should not be public, determined by the ability to be restorable by anyone"
      query = file("queries/ec2/ebs_snapshot_permissions_check.sql")
    }

    check "2" {
      title = "The VPC default security group should not allow inbound and outbound traffic"
      query = file("queries/ec2/default_sg_no_access.sql")
    }

    check "3" {
      title = "Attached EBS volumes should be encrypted at rest"
      query = file("queries/ec2/unencrypted_ebs_volumes.sql")
    }

    check "4" {
      title = "Stopped EC2 instances should be removed after a specified time period"
      query = file("queries/ec2/stopped_more_thant_30_days_ago_instances.sql")
    }


    check "6" {
      title = "VPC flow logging should be enabled in all VPCs"
      query = file("queries/ec2/flow_logs_enabled_in_all_vpcs.sql")
    }

    check "7" {
      title = "EBS default encryption should be enabled"
      query = file("queries/ec2/ebs_encryption_by_default_disabled.sql")
    }

    check "8" {
      title = "EC2 instances should use IMDSv2"
      query = file("queries/ec2/not_imdsV2_instances.sql")
    }

    check "9" {
      title = "EC2 instances should not have a public IP address"
      query = file("queries/ec2/instances_with_public_ip.sql")
    }

    check "10" {
      title = "Amazon EC2 should be configured to use VPC endpoints that are created for the Amazon EC2 service"
      query = file("queries/ec2/vpcs_without_ec2_endpoint.sql")
    }

    check "15" {
      title = "EC2 subnets should not automatically assign public IP addresses"
      query = file("queries/ec2/subnets_that_assign_public_ips.sql")
    }

    check "16" {
      title = "Unused network access control lists should be removed"
      query = file("queries/ec2/unused_acls.sql")
    }

    check "17" {
      title = "EC2 instances should not use multiple ENIs"
      query = file("queries/ec2/instances_with_more_than_2_network_interfaces.sql")
    }

    check "18" {
      title = "Security groups should only allow unrestricted incoming traffic for authorized ports"
      query = file("queries/ec2/security_groups_with_access_to_unauthorized_ports.sql")
    }

    check "19" {
      title = "Security groups should not allow unrestricted access to ports with high risk"
      query = file("queries/ec2/security_groups_with_open_critical_ports.sql")
    }
  }