policy "aws" {
  description = "AWS Security & Compliance"
  configuration {
    provider "aws" {
      version = ">= 0.6.4"
    }
  }

  policy "cis-v1.2.0" {
    description = "AWS CIS V1.2.0 Policy"
    source      = file("cis_v1.2.0/policy.hcl")
  }

}
