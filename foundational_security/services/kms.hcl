policy "kms" {
    title = "KMS controls"
    check "1" {
      title = "IAM customer managed policies should not allow decryption and re-encryption actions on all KMS keys"
      query = file("queries/kms/customer_policy_blocked_kms_actions.sql")
    }

    check "2" {
      title = "IAM principals should not have IAM inline policies that allow decryption and re-encryption actions on all KMS keys"
      query = file("queries/kms/inline_policy_blocked_kms_actions.sql")
    }

    check "3" {
      title = "AWS KMS keys should not be unintentionally deleted"
      query = file("queries/kms/cmk_not_scheduled_for_deletion.sql")
    }
  }