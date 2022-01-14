policy "dms" {
  title = "AWS DMS controls"
  doc   = file("foundational_security/docs/DMS.md")
  check "DMS.1" {
    title = "AWS Database Migration Service replication instances should not be public"
    query = file("queries/dms/replication_not_public.sql")
    doc   = file("foundational_security/docs/DMS.1.md")
  }
}