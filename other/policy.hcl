policy "other" {
  title = "Other, uncategorized queries"

  configuration {
    provider "aws" {
      version = "~> 0.10.0"
    }
  }

  check "ec2-ebs-snapshots-shared" {
    type  = "manual"
    title = "Find all ec2 ebs snapshots that are shared publicly and/or with other accounts."
    query = file("queries/ec2/ebs_snapshot_shared.sql")
  }

  check "rds-cluster-snapshots-shared" {
    type  = "manual"
    title = "Find all rds cluster snapshots that are shared publicly and/or with other accounts."
    query = file("queries/rds/rds_cluster_snapshot_shared.sql")
  }

  check "rds-db-snapshots-shared" {
    type  = "manual"
    title = "Find all rds db snapshots that are shared publicly and/or with other accounts."
    query = file("queries/rds/rds_db_snapshot_shared.sql")
  }
}
