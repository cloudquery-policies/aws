policy "aws" {
  description = "AWS Security & Compliance"
  configuration {
    provider "aws" {
      version = ">= 0.6.4"
    }
  }

  policy "cis_v1.2.0" {
    description = "AWS CIS V1.2.0 Policy"
    source      = file("cis_v1.2.0/policy.hcl")
  }

  policy "pci_dss_v3.2.1" {
    description = "AWS PCI DSS V3.2.1 Policy"
    source      = file("pci_dss_v3.2.1/policy.hcl")
  }

  policy "public_egress" {
    description = "Identify compute resources with potentially unrestricted egress"
    source      = file("public_egress/policy.hcl")
  }
}
