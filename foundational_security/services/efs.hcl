policy "efs" {
  title = "EFS controls"
  check "EFS.1" {
    title = "Amazon EFS should be configured to encrypt file data at rest using AWS KMS"
    query = "select 1;"
  }

  check "EFS.2" {
    title = "Amazon EFS volumes should be in backup plans"
    query = "select 1;"
  }
}