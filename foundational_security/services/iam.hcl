policy "iam" {
  title = "IAM controls"
  doc   = file("foundational_security/docs/iam.md")
  check "IAM.1" {
    title = "IAM policies should not allow full '*' administrative privileges"
    query = file("queries/iam/policies_with_admin_rights.sql")
    doc   = file("foundational_security/docs/iam.1.md")
  }

  check "IAM.2" {
    title = "IAM users should not have IAM policies attached"
    query = file("queries/iam/policies_attached_to_groups_roles.sql")
    doc   = file("foundational_security/docs/iam.2.md")
  }

  check "IAM.3" {
    title = "IAM users' access keys should be rotated every 90 days or less"
    query = file("queries/iam/iam_access_keys_rotated_more_than_90_days.sql")
    doc   = file("foundational_security/docs/iam.3.md")
  }

  check "IAM.4" {
    title = "IAM root user access key should not exist"
    query = file("queries/iam/root_user_no_access_keys.sql")
    doc   = file("foundational_security/docs/iam.4.md")
  }

  check "IAM.5" {
    title = "MFA should be enabled for all IAM users that have a console password"
    query = file("queries/iam/mfa_enabled_for_console_access.sql")
    doc   = file("foundational_security/docs/iam.5.md")
  }

  check "IAM.6" {
    title = "Hardware MFA should be enabled for the root user"
    query = file("queries/iam/hardware_mfa_enabled_for_root.sql")
    doc   = file("foundational_security/docs/iam.6.md")
  }

  check "IAM.7" {
    title = "Password policies for IAM users should have strong configurations"
    query = file("queries/iam/password_policy_strong.sql")
    doc   = file("foundational_security/docs/iam.7.md")
  }

  check "IAM.8" {
    title = "Unused IAM user credentials should be removed"
    query = file("queries/iam/iam_access_keys_unused_more_than_90_days.sql")
    doc   = file("foundational_security/docs/iam.8.md")
  }

  check "IAM.21" {
    title = "IAM customer managed policies that you create should not allow wildcard actions for services"
    query = file("queries/iam/wildcard_access_policies.sql")
    doc   = file("foundational_security/docs/iam.21.md")
  }
}