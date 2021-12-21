policy "1" {
    description = "Section 1: Identity and Access Management"
    readme = file("cis_v1.2.0/docs/1.md")

    check "1.1" {
        description = "AWS CIS 1.1 Avoid the use of 'root' account. Show used in last 30 days (Scored)"
        readme = file("cis_v1.2.0/docs/1.1.md")
        query       = file("queries/iam/avoid_root_usage.sql")
    }

    check "1.2" {
        description = "AWS CIS 1.2 Ensure MFA is enabled for all IAM users that have a console password (Scored)"
        readme = file("cis_v1.2.0/docs/1.2.md")
        query       = file("queries/iam/mfa_enabled_for_console_access.sql")
    }

    check "1.3" {
        description = "AWS CIS 1.3 Ensure credentials unused for 90 days or greater are disabled (Scored)"
        readme = file("cis_v1.2.0/docs/1.3.md")
        query       = file("queries/iam/unused_creds_disabled.sql")
    }

    check "1.4" {
        description = "AWS CIS 1.4 Ensure access keys are rotated every 90 days or less"
        readme = file("cis_v1.2.0/docs/1.4.md")
        query       = file("queries/iam/old_access_keys.sql")
    }

    check "1.5" {
        description = "AWS CIS 1.5  Ensure IAM password policy requires at least one uppercase letter"
        readme = file("cis_v1.2.0/docs/1.5.md")
        query       = file("queries/iam/password_policy_min_uppercase.sql")
    }

    check "1.6" {
        description = "AWS CIS 1.6  Ensure IAM password policy requires at least one lowercase letter"
        readme = file("cis_v1.2.0/docs/1.6.md")
        query       = file("queries/iam/password_policy_min_lowercase.sql")
    }

    check "1.7" {
        description = "AWS CIS 1.7  Ensure IAM password policy requires at least one symbol"
        readme = file("cis_v1.2.0/docs/1.7.md")
        query       = file("queries/iam/password_policy_min_one_symbol.sql")
    }

    check "1.8" {
        description = "AWS CIS 1.8  Ensure IAM password policy requires at least one number"
        readme = file("cis_v1.2.0/docs/1.8.md")
        query       = file("queries/iam/password_policy_min_number.sql")
    }

    check "1.9" {
        description = "AWS CIS 1.9 Ensure IAM password policy requires minimum length of 14 or greater"
        readme = file("cis_v1.2.0/docs/1.9.md")
        query       = file("queries/iam/password_policy_min_length.sql")
    }

    check "1.10" {
        description = "AWS CIS 1.10 Ensure IAM password policy prevents password reuse"
        readme = file("cis_v1.2.0/docs/1.10.md")
        query       = file("queries/iam/password_policy_prevent_reuse.sql")
    }

    check "1.11" {
        description = "AWS CIS 1.11 Ensure IAM password policy expires passwords within 90 days or less"
        readme = file("cis_v1.2.0/docs/1.11.md")
        query       = file("queries/iam/password_policy_prevent_reuse.sql")
    }

    check "1.12" {
        description = "AWS CIS 1.12  Ensure no root account access key exists (Scored)"
        readme = file("cis_v1.2.0/docs/1.12.md")
        query       = file("queries/iam/root_user_no_access_keys.sql")
    }

    check "1.13" {
        description = "AWS CIS 1.13 Ensure MFA is enabled for the 'root' account"
        readme = file("cis_v1.2.0/docs/1.13.md")
        query       = file("queries/iam/mfa_enabled_for_root.sql")
    }

    check "1.14" {
        description = "AWS CIS 1.14 Ensure hardware MFA is enabled for the 'root' account (Scored)"
        readme = file("cis_v1.2.0/docs/1.14.md")
        query       = file("queries/iam/hardware_mfa_enabled_for_root.sql")
    }

    check "1.16" {
        description = "AWS CIS 1.16 Ensure IAM policies are attached only to groups or roles (Scored)"
        readme = file("cis_v1.2.0/docs/1.16.md")
        query       = file("queries/iam/policies_attached_to_groups_roles.sql")
    }
}
