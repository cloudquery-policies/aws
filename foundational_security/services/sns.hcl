policy "sns" {
  title = "SNS"
  check "SNS.1" {
    title = "SNS topics should be encrypted at rest using AWS KMS"
    query = file("queries/sns/sns_topics_should_be_encrypted_at_rest_using_aws_kms.sql")
  }
}