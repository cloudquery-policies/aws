policy "sqs" {
  title = "SQS"
  doc   = file("foundational_security/docs/sqs.md")
  check "SQS.1" {
    title = "SNS topics should be encrypted at rest using AWS KMS"
    query = file("queries/sqs/sqs_queues_should_be_encrypted_at_rest_using_aws_kms.sql")
    doc   = file("foundational_security/docs/sqs.1.md")
  }
}