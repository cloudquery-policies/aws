policy "rds" {
  title = "RDS controls"
  check "RDS.1" {
    title = "RDS snapshots should be private"
    query = file("queries/rds/snapshots_should_prohibit_public_access.sql")
  }

  check "RDS.2" {
    title = "RDS DB instances should prohibit public access, determined by the PubliclyAccessible configuration"
    query = file("queries/rds/rds_db_instances_should_prohibit_public_access.sql")
  }

  check "RDS.3" {
    title = "RDS DB instances should have encryption at rest enabled"
    query = file("queries/rds/rds_db_instances_should_have_encryption_at_rest_enabled.sql")
  }

  check "RDS.4" {
    title = "RDS cluster snapshots and database snapshots should be encrypted at rest"
    query = file("queries/rds/rds_cluster_snapshots_and_database_snapshots_should_be_encrypted_at_rest.sql")
  }

  check "RDS.5" {
    title = "RDS DB instances should be configured with multiple Availability Zones"
    query = file("queries/rds/rds_db_instances_should_be_configured_with_multiple_availability_zones.sql")
  }

  check "RDS.6" {
    title = "Enhanced monitoring should be configured for RDS DB instances and clusters"
    query = file("queries/rds/enhanced_monitoring_should_be_configured_for_rds_db_instances_and_clusters.sql")
  }

  check "RDS.7" {
    title = "RDS clusters should have deletion protection enabled"
    query = file("queries/rds/rds_clusters_should_have_deletion_protection_enabled.sql")
  }

  check "RDS.8" {
    title = "RDS DB instances should have deletion protection enabled"
    query = file("queries/rds/rds_db_instances_should_have_deletion_protection_enabled.sql")
  }

  check "RDS.9" {
    title = "Database logging should be enabled"
    query = file("queries/rds/database_logging_should_be_enabled.sql")
  }

  check "RDS.10" {
    title = "IAM authentication should be configured for RDS instances"
    query = file("queries/rds/iam_authentication_should_be_configured_for_rds_instances.sql")
  }

  check "RDS.12" {
    title = "IAM authentication should be configured for RDS clusters"
    query = file("queries/rds/iam_authentication_should_be_configured_for_rds_clusters.sql")
  }

  check "RDS.13" {
    title = "RDS automatic minor version upgrades should be enabled"
    query = file("queries/rds/rds_automatic_minor_version_upgrades_should_be_enabled.sql")
  }

  check "RDS.14" {
    title = "Amazon Aurora clusters should have backtracking enabled"
    query = file("queries/rds/amazon_aurora_clusters_should_have_backtracking_enabled.sql")
  }

  check "RDS.15" {
    title = "RDS DB clusters should be configured for multiple Availability Zones"
    query = file("queries/rds/rds_db_clusters_should_be_configured_for_multiple_availability_zones.sql")
  }

  check "RDS.16" {
    title = "RDS DB clusters should be configured to copy tags to snapshots"
    query = file("queries/rds/rds_db_clusters_should_be_configured_to_copy_tags_to_snapshots.sql")
  }

  check "RDS.17" {
    title = "RDS DB instances should be configured to copy tags to snapshots"
    query = file("queries/rds/rds_db_instances_should_be_configured_to_copy_tags_to_snapshots.sql")
  }

  check "RDS.18" {
    title = "RDS instances should be deployed in a VPC"
    query = file("queries/rds/rds_instances_should_be_deployed_in_a_vpc.sql")
  }

  check "RDS.19" {
    title = "An RDS event notifications subscription should be configured for critical cluster events"
    query = file("queries/rds/rds_event_notifications_subscription_should_be_configured_for_critical_cluster_events.sql")
  }

  check "RDS.20" {
    title = "An RDS event notifications subscription should be configured for critical database instance events"
    query = file("queries/rds/rds_event_notifications_subscription_should_be_configured_for_critical_database_instance_events.sql")
  }

  check "RDS.21" {
    title = "An RDS event notifications subscription should be configured for critical database parameter group events"
    query = file("queries/rds/rds_event_notifications_subscription_should_be_configured_for_critical_database_parameter_group_events.sql")
  }

  check "RDS.22" {
    title = "An RDS event notifications subscription should be configured for critical database security group events"
    query = file("queries/rds/rds_event_notifications_subscription_should_be_configured_for_critical_database_security_group_events.sql")
  }

  check "RDS.23" {
    title = "RDS databases and clusters should not use a database engine default port"
    query = file("queries/rds/rds_databases_and_clusters_should_not_use_a_database_engine_default_port.sql")
  }
}