policy "1" {
  identifiers = ["account_id"]
  title       = "Section 1: Identity and Access Management"
  doc         = file("cis_v1.2.0/docs/1.md")

  check "1.1" {
    title = "Avoid the use of 'root' account. Show used in last 30 days (Scored)"
    doc   = file("cis_v1.2.0/docs/1.1.md")
    query = file("queries/iam/avoid_root_usage.sql")
  }

  check "1.2" {
    title = "Ensure MFA is enabled for all IAM users that have a console password (Scored)"
    doc   = file("cis_v1.2.0/docs/1.2.md")
    query = file("queries/iam/mfa_enabled_for_console_access.sql")
  }

  check "1.3" {
    title = "Ensure credentials unused for 90 days or greater are disabled (Scored)"
    doc   = file("cis_v1.2.0/docs/1.3.md")
    query = file("queries/iam/unused_creds_disabled.sql")
  }

  check "1.4" {
    title = "Ensure access keys are rotated every 90 days or less"
    doc   = file("cis_v1.2.0/docs/1.4.md")
    query = file("queries/iam/old_access_keys.sql")
  }

  check "1.5" {
    title = " Ensure IAM password policy requires at least one uppercase letter"
    doc   = file("cis_v1.2.0/docs/1.5.md")
    query = file("queries/iam/password_policy_min_uppercase.sql")
  }

  check "1.6" {
    title = " Ensure IAM password policy requires at least one lowercase letter"
    doc   = file("cis_v1.2.0/docs/1.6.md")
    query = file("queries/iam/password_policy_min_lowercase.sql")
  }

  check "1.7" {
    title = " Ensure IAM password policy requires at least one symbol"
    doc   = file("cis_v1.2.0/docs/1.7.md")
    query = file("queries/iam/password_policy_min_one_symbol.sql")
  }

  check "1.8" {
    title = " Ensure IAM password policy requires at least one number"
    doc   = file("cis_v1.2.0/docs/1.8.md")
    query = file("queries/iam/password_policy_min_number.sql")
  }

  check "1.9" {
    title = "Ensure IAM password policy requires minimum length of 14 or greater"
    doc   = file("cis_v1.2.0/docs/1.9.md")
    query = file("queries/iam/password_policy_min_length.sql")
  }

  check "1.10" {
    title = "Ensure IAM password policy prevents password reuse"
    doc   = file("cis_v1.2.0/docs/1.10.md")
    query = file("queries/iam/password_policy_prevent_reuse.sql")
  }

  check "1.11" {
    title = "Ensure IAM password policy expires passwords within 90 days or less"
    doc   = file("cis_v1.2.0/docs/1.11.md")
    query = file("queries/iam/password_policy_expire_old_passwords.sql")
  }

  check "1.12" {
    title = " Ensure no root account access key exists (Scored)"
    doc   = file("cis_v1.2.0/docs/1.12.md")
    query = file("queries/iam/root_user_no_access_keys.sql")
  }

  check "1.13" {
    title = "Ensure MFA is enabled for the 'root' account"
    doc   = file("cis_v1.2.0/docs/1.13.md")
    query = file("queries/iam/mfa_enabled_for_root.sql")
  }

  check "1.14" {
    title = "Ensure hardware MFA is enabled for the 'root' account (Scored)"
    doc   = file("cis_v1.2.0/docs/1.14.md")
    query = file("queries/iam/hardware_mfa_enabled_for_root.sql")
  }

  check "1.16" {
    title = "Ensure IAM policies are attached only to groups or roles (Scored)"
    doc   = file("cis_v1.2.0/docs/1.16.md")
    query = file("queries/iam/policies_attached_to_groups_roles.sql")
  }
}
