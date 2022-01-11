policy "iam" {
  title = "IAM controls"
  check "1" {
    title = "IAM policies should not allow full '*' administrative privileges"
    query = file("queries/iam/policies_with_admin_rights.sql")
  }

  check "2" {
    title = "IAM users should not have IAM policies attached"
    query = file("queries/iam/policies_attached_to_groups_roles.sql")
  }

  check "3" {
    title = "IAM users' access keys should be rotated every 90 days or less"
    query = file("queries/iam/iam_access_keys_rotated_more_than_90_days.sql")
  }

  check "4" {
    title = "IAM root user access key should not exist"
    query = file("queries/iam/root_user_no_access_keys.sql")
  }

  check "5" {
    title = "MFA should be enabled for all IAM users that have a console password"
    query = file("queries/iam/mfa_enabled_for_console_access.sql")
  }

  check "6" {
    title = "Hardware MFA should be enabled for the root user"
    query = file("queries/iam/hardware_mfa_enabled_for_root.sql")
  }

  check "7" {
    title = "Password policies for IAM users should have strong configurations"
    query = file("queries/iam/password_policy_strong.sql")
  }

  check "8" {
    title = "Unused IAM user credentials should be removed"
    query = file("queries/iam/iam_access_keys_unused_more_than_90_days.sql")
  }

  check "21" {
    title = "IAM customer managed policies that you create should not allow wildcard actions for services"
    query = file("queries/iam/wildcard_access_policies.sql")
  }
}