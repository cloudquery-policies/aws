policy "sagemaker" {
  title = "SageMaker"
  check "SageMaker.1" {
    title = "Amazon SageMaker notebook instances should not have direct internet access"
    query = file("queries/sagemaker/sagemaker_notebook_instance_direct_internet_access_disabled.sql")
  }
}