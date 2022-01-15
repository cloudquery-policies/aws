policy "codebuild" {
  title = "codebuild controls"
  doc   = file("foundational_security/docs/CodeBuild.md")
  check "CodeBuild.1" {
    title = "CodeBuild GitHub or Bitbucket source repository URLs should use OAuth"
    query = file("queries/codebuild/check_oauth_usage_for_sources.sql")
    doc   = file("foundational_security/docs/CodeBuild.1.md")
  }

  check "CodeBuild.2" {
    title = "CodeBuild project environment variables should not contain clear text credentials"
    query = file("queries/codebuild/check_environment_variables.sql")
    doc   = file("foundational_security/docs/CodeBuild.2.md")
  }
}