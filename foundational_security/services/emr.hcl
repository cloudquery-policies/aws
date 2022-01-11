policy "emr" {
    title = "EMR controls"
    check "1" {
      title = "Amazon EMR cluster master nodes should not have public IP addresses"
      query = file("queries/emr/emr_cluster_master_nodes_should_not_have_public_ip_addresses.sql")
    }
  }