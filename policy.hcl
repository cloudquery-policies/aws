policy "aws" {
  title = "AWS Security & Compliance"
  doc   = file("README.md")
  configuration {
    provider "aws" {
      version = "~> 0.10.0"
    }
  }

  policy "cis_v1.2.0" {
    title  = "AWS CIS V1.2.0 Policy"
    source = file("cis_v1.2.0/policy.hcl")
  }

  policy "pci_dss_v3.2.1" {
    title  = "AWS PCI DSS V3.2.1 Policy"
    source = file("pci_dss_v3.2.1/policy.hcl")
  }

  policy "foundational_security" {
    title  = "AWS Foundational Security Best Practices"
    source = file("foundational_security/policy.hcl")
  }

  policy "public_egress" {
    title  = "Identify compute resources with potentially unrestricted egress"
    source = file("public_egress/policy.hcl")
  }

  policy "publicly_available" {
    title  = "Find all resources with public IPs"
    source = file("publicly_available/policy.hcl")
  }
}
