policy "sagemaker" {
  title = "SageMaker"
  doc   = file("foundational_security/docs/sagemaker.md")
  check "SageMaker.1" {
    title = "Amazon SageMaker notebook instances should not have direct internet access"
    query = file("queries/sagemaker/sagemaker_notebook_instance_direct_internet_access_disabled.sql")
    doc   = file("foundational_security/docs/sagemaker.1.md")
  }
}