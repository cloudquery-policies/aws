policy "4" {
  title = "Section 4: Networking"
  doc   = file("cis_v1.2.0/docs/4.md")

  view "aws_security_group_ingress_rules" {
    title = "Aggregates rules of security groups with ports and IPs including ipv6"
    query = file("queries/cq_views/aws_security_group_ingress_rules.sql")
  }

  check "4.1" {
    title = "4.1 Ensure no security groups allow ingress from 0.0.0.0/0 to port 22 (Scored)"
    doc   = file("cis_v1.2.0/docs/4.1.md")
    query = file("queries/ec2/no_broad_public_ingress_on_port_22.sql")
  }

  check "4.2" {
    title = "4.2 Ensure no security groups allow ingress from 0.0.0.0/0 to port 3389 (Scored)"
    doc   = file("cis_v1.2.0/docs/4.2.md")
    query = file("queries/ec2/no_broad_public_ingress_on_port_3389.sql")
  }

  check "4.3" {
    title = "4.3  Ensure the default security group of every VPC restricts all traffic (Scored)"
    doc   = file("cis_v1.2.0/docs/4.3.md")
    query = file("queries/ec2/default_sg_no_access.sql")
  }
}