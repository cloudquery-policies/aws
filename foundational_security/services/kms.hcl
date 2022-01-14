policy "kms" {
  title = "KMS controls"
  doc   = file("foundational_security/docs/KMS.md")
  check "KMS.1" {
    title = "IAM customer managed policies should not allow decryption and re-encryption actions on all KMS keys"
    query = file("queries/kms/customer_policy_blocked_kms_actions.sql")
    doc   = file("foundational_security/docs/KMS.1.md")
  }

  check "KMS.2" {
    title = "IAM principals should not have IAM inline policies that allow decryption and re-encryption actions on all KMS keys"
    query = file("queries/kms/inline_policy_blocked_kms_actions.sql")
    doc   = file("foundational_security/docs/KMS.2.md")
  }

  check "KMS.3" {
    title = "AWS KMS keys should not be unintentionally deleted"
    query = file("queries/kms/cmk_not_scheduled_for_deletion.sql")
    doc   = file("foundational_security/docs/KMS.3.md")
  }
}