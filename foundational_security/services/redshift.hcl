policy "redshift" {
  title = "Redshift controls"
  doc   = file("foundational_security/docs/Redshift.md")

  check "Redshift.1" {
    title = "Amazon Redshift clusters should prohibit public access"
    query = file("queries/redshift/cluster_publicly_accessible.sql")
    doc   = file("foundational_security/docs/Redshift.1.md")
  }

  check "Redshift.2" {
    title = "Connections to Amazon Redshift clusters should be encrypted in transit"
    query = file("queries/redshift/clusters_should_be_encrypted_in_transit.sql")
    doc   = file("foundational_security/docs/Redshift.2.md")
  }

  check "Redshift.3" {
    title = "Amazon Redshift clusters should have automatic snapshots enabled"
    query = file("queries/redshift/clusters_should_have_automatic_snapshots_enabled.sql")
    doc   = file("foundational_security/docs/Redshift.3.md")
  }

  check "Redshift.4" {
    title = "Amazon Redshift clusters should have audit logging enabled"
    query = file("queries/redshift/clusters_should_have_audit_logging_enabled.sql")
    doc   = file("foundational_security/docs/Redshift.4.md")
  }

  check "Redshift.6" {
    title = "Amazon Redshift should have automatic upgrades to major versions enabled"
    query = file("queries/redshift/clusters_should_have_automatic_upgrades_to_major_versions_enabled.sql")
    doc   = file("foundational_security/docs/Redshift.6.md")
  }

  check "Redshift.7" {
    title = "Amazon Redshift clusters should use enhanced VPC routing"
    query = file("queries/redshift/clusters_should_use_enhanced_vpc_routing.sql")
    doc   = file("foundational_security/docs/Redshift.7.md")
  }
}