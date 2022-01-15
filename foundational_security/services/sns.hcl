policy "sns" {
  title = "SNS"
  doc   = file("foundational_security/docs/sns.md")
  check "SNS.1" {
    title = "SNS topics should be encrypted at rest using AWS KMS"
    query = file("queries/sns/sns_topics_should_be_encrypted_at_rest_using_aws_kms.sql")
    doc   = file("foundational_security/docs/sns.1.md")
  }
}