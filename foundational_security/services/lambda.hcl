policy "lambda" {
  title = "Lambda controls"
  doc   = file("foundational_security/docs/Lambda.md")
  check "Lambda.1" {
    title = "Lambda function policies should prohibit public access"
    query = file("queries/lambda/lambda_function_prohibit_public_access.sql")
    doc   = file("foundational_security/docs/Lambda.1.md")
  }

  check "Lambda.2" {
    title = "Lambda functions should use supported runtimes"
    query = file("queries/lambda/lambda_functions_should_use_supported_runtimes.sql")
    doc   = file("foundational_security/docs/Lambda.2.md")
  }
}