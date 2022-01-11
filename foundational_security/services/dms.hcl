policy "dms" {
  title = "AWS config controls"
  check "DMS.1" {
    title = "AWS Database Migration Service replication instances should not be public"
    query = file("queries/dms/replication_not_public.sql")
  }
}