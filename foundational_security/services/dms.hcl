policy "dms" {
  title = "AWS DMS controls"
  doc   = file("foundational_security/docs/dms.md")
  check "DMS.1" {
    title = "AWS Database Migration Service replication instances should not be public"
    query = file("queries/dms/replication_not_public.sql")
    doc   = file("foundational_security/docs/dms.1.md")
  }
}