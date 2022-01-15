policy "dynamodb" {
  title = "DynamoDB controls"
  doc   = file("foundational_security/docs/dynamodb.md")
  check "DynamoDB.1" {
    title = "DynamoDB tables should automatically scale capacity with demand"
    query = file("queries/dynamodb/autoscale_or_ondemand.sql")
    doc   = file("foundational_security/docs/dynamodb.1.md")
  }

  check "DynamoDB.2" {
    title = "DynamoDB tables should have point-in-time recovery enabled"
    query = file("queries/dynamodb/point_in_time_recovery.sql")
    doc   = file("foundational_security/docs/dynamodb.2.md")
  }

  check "DynamoDB.3" {
    title = "DynamoDB Accelerator (DAX) clusters should be encrypted at rest"
    query = file("queries/dynamodb/dax_encrypted_at_rest.sql")
    doc   = file("foundational_security/docs/dynamodb.3.md")
  }
}