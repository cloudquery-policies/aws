policy "secretsmanager" {
  title = "SecretsManager controls"
  doc   = file("foundational_security/docs/secretsmanager.md")
  check "SecretsManager.1" {
    title = "Secrets Manager secrets should have automatic rotation enabled"
    query = file("queries/secretsmanager/secrets_should_have_automatic_rotation_enabled.sql")
    doc   = file("foundational_security/docs/secretsmanager.1.md")
  }
  check "SecretsManager.2" {
    title = "Secrets Manager secrets configured with automatic rotation should rotate successfully"
    query = file("queries/secretsmanager/secrets_configured_with_automatic_rotation_should_rotate_successfully.sql")
    doc   = file("foundational_security/docs/secretsmanager.2.md")
  }
  check "SecretsManager.3" {
    title = "Remove unused Secrets Manager secrets"
    query = file("queries/secretsmanager/remove_unused_secrets_manager_secrets.sql")
    doc   = file("foundational_security/docs/secretsmanager.3.md")
  }
  check "SecretsManager.4" {
    title = "Secrets Manager secrets should be rotated within a specified number of days"
    query = file("queries/secretsmanager/secrets_should_be_rotated_within_a_specified_number_of_days.sql")
    doc   = file("foundational_security/docs/secretsmanager.4.md")
  }
}