policy "emr" {
  title = "EMR controls"
  doc   = file("foundational_security/docs/EMR.md")
  check "EMR.1" {
    title = "Amazon EMR cluster master nodes should not have public IP addresses"
    query = file("queries/emr/emr_cluster_master_nodes_should_not_have_public_ip_addresses.sql")
    doc   = file("foundational_security/docs/EMR.1.md")
  }
}