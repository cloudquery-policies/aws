policy "secretsmanager" {
  title = "SecretsManager controls"
  doc   = file("foundational_security/docs/SecretsManager.md")
  check "SecretsManager.1" {
    title = "Secrets Manager secrets should have automatic rotation enabled"
    query = "select 1;"
    doc   = file("foundational_security/docs/SecretsManager.1.md")
  }
  check "SecretsManager.2" {
    title = "Secrets Manager secrets configured with automatic rotation should rotate successfully"
    query = "select 1;"
    doc   = file("foundational_security/docs/SecretsManager.2.md")
  }
  check "SecretsManager.3" {
    title = "Remove unused Secrets Manager secrets"
    query = "select 1;"
    doc   = file("foundational_security/docs/SecretsManager.3.md")
  }
  check "SecretsManager.4" {
    title = "Secrets Manager secrets should be rotated within a specified number of days"
    query = "select 1;"
    doc   = file("foundational_security/docs/SecretsManager.4.md")
  }
}