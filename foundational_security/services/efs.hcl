policy "efs" {
  title = "EFS controls"
  doc   = file("foundational_security/docs/efs.md")

  check "EFS.1" {
    title = "Amazon EFS should be configured to encrypt file data at rest using AWS KMS"
    query = file("queries/efs/unencrypted_efs_filesystems.sql")
    doc   = file("foundational_security/docs/efs.1.md")
  }

  check "EFS.2" {
    title = "Amazon EFS volumes should be in backup plans"
    doc   = file("foundational_security/docs/efs.2.md")
    query = file("queries/efs/efs_filesystems_with_disabled_backups.sql")
  }
}