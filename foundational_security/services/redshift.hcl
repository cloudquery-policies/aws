policy "redshift" {
  title = "Redshift"

  check "1" {
    title = "Amazon Redshift clusters should prohibit public access"
    query = file("queries/redshift/cluster_publicly_accessible.sql")
  }

  check "2" {
    title = "Connections to Amazon Redshift clusters should be encrypted in transit"
    query = file("queries/redshift/clusters_should_be_encrypted_in_transit.sql")
  }

  check "3" {
    title = "Amazon Redshift clusters should have automatic snapshots enabled"
    query = file("queries/redshift/clusters_should_have_automatic_snapshots_enabled.sql")
  }

  check "4" {
    title = "Amazon Redshift clusters should have audit logging enabled"
    query = file("queries/redshift/clusters_should_have_audit_logging_enabled.sql")
  }

  check "6" {
    title = "Amazon Redshift should have automatic upgrades to major versions enabled"
    query = file("queries/redshift/clusters_should_have_automatic_upgrades_to_major_versions_enabled.sql")
  }

  check "7" {
    title = "Amazon Redshift clusters should use enhanced VPC routing"
    query = file("queries/redshift/clusters_should_use_enhanced_vpc_routing.sql")
  }
}