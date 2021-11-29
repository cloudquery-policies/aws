policy "aws" {
  description = "AWS Security & Compliance"
  configuration {
    provider "aws" {
      version = ">= 0.6.4"
    }
  }

  policy "cis-v1.20" {
    description = "AWS CIS V1.20 Policy"
    source      = file("cis_1.2.0/policy.hcl")
  }

}