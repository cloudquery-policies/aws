policy "secretmanager" {
  title = "SecretManager controls"
  check "1" {
    title = "Secrets Manager secrets should have automatic rotation enabled"
    query = "select 1;"
  }
  check "2" {
    title = "Secrets Manager secrets configured with automatic rotation should rotate successfully"
    query = "select 1;"
  }
  check "3" {
    title = "Remove unused Secrets Manager secrets"
    query = "select 1;"
  }
  check "4" {
    title = "Secrets Manager secrets should be rotated within a specified number of days"
    query = "select 1;"
  }
}