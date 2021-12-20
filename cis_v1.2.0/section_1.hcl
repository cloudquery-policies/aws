policy "1" {
    name = "Section 1: Identity and Access Management"
    description = file("cis_v1.2.0/docs/1.md")

    query "1.1" {
        name = "AWS CIS 1.1 Avoid the use of 'root' account. Show used in last 30 days (Scored)"
        description = file("cis_v1.2.0/docs/1.1.md")
        query       = file("queries/iam/avoid_root_usage.sql")
    }

    query "1.2" {
        name = "AWS CIS 1.2 Ensure MFA is enabled for all IAM users that have a console password (Scored)"
        description = file("cis_v1.2.0/docs/1.2.md")
        query       = file("queries/iam/mfa_enabled_for_console_access.sql")
    }

    query "1.3" {
        name = "AWS CIS 1.3 Ensure credentials unused for 90 days or greater are disabled (Scored)"
        description = file("cis_v1.2.0/docs/1.3.md")
        query       = file("queries/iam/unused_creds_disabled.sql")
    }

    query "1.4" {
        name = "AWS CIS 1.4 Ensure access keys are rotated every 90 days or less"
        description = file("cis_v1.2.0/docs/1.4.md")
        query       = file("queries/iam/old_access_keys.sql")
    }

    query "1.5" {
        name = "AWS CIS 1.5  Ensure IAM password policy requires at least one uppercase letter"
        description = file("cis_v1.2.0/docs/1.5.md")
        query       = file("queries/iam/password_policy_min_uppercase.sql")
    }

    query "1.6" {
        name = "AWS CIS 1.6  Ensure IAM password policy requires at least one lowercase letter"
        description = file("cis_v1.2.0/docs/1.6.md")
        query       = file("queries/iam/password_policy_min_lowercase.sql")
    }

    query "1.7" {
        name = "AWS CIS 1.7  Ensure IAM password policy requires at least one symbol"
        description = file("cis_v1.2.0/docs/1.7.md")
        query       = file("queries/iam/password_policy_min_one_symbol.sql")
    }

    query "1.8" {
        name = "AWS CIS 1.8  Ensure IAM password policy requires at least one number"
        description = file("cis_v1.2.0/docs/1.8.md")
        query       = file("queries/iam/password_policy_min_number.sql")
    }

    query "1.9" {
        name = "AWS CIS 1.9 Ensure IAM password policy requires minimum length of 14 or greater"
        description = file("cis_v1.2.0/docs/1.9.md")
        query       = file("queries/iam/password_policy_min_length.sql")
    }

    query "1.10" {
        name = "AWS CIS 1.10 Ensure IAM password policy prevents password reuse"
        description = file("cis_v1.2.0/docs/1.10.md")
        query       = file("queries/iam/password_policy_prevent_reuse.sql")
    }

    query "1.11" {
        name = "AWS CIS 1.11 Ensure IAM password policy expires passwords within 90 days or less"
        description = file("cis_v1.2.0/docs/1.11.md")
        query       = file("queries/iam/password_policy_prevent_reuse.sql")
    }

    query "1.12" {
        name = "AWS CIS 1.12  Ensure no root account access key exists (Scored)"
        description = file("cis_v1.2.0/docs/1.12.md")
        query       = file("queries/iam/root_user_no_access_keys.sql")
    }

    query "1.13" {
        name = "AWS CIS 1.13 Ensure MFA is enabled for the 'root' account"
        description = file("cis_v1.2.0/docs/1.13.md")
        query       = file("queries/iam/mfa_enabled_for_root.sql")
    }

    query "1.14" {
        name = "AWS CIS 1.14 Ensure hardware MFA is enabled for the 'root' account (Scored)"
        description = file("cis_v1.2.0/docs/1.14.md")
        query       = file("queries/iam/hardware_mfa_enabled_for_root.sql")
    }

    query "1.16" {
        name = "AWS CIS 1.16 Ensure IAM policies are attached only to groups or roles (Scored)"
        description = file("cis_v1.2.0/docs/1.16.md")
        query       = file("queries/iam/policies_attached_to_groups_roles.sql")
    }
}
