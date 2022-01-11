policy "ssm" {
    title = "SSM controls"
    check "1" {
      title = "EC2 instances should be managed by AWS Systems Manager"
      query = file("queries/ssm/ec2_instances_should_be_managed_by_ssm.sql")
    }
    check "2" {
      title = "All EC2 instances managed by Systems Manager should be compliant with patching requirements"
      query = file("queries/ssm/instances_should_have_patch_compliance_status_of_compliant.sql")
    }
    check "3" {
      title = "Instances managed by Systems Manager should have an association compliance status of COMPLIANT"
      query = file("queries/ssm/instances_should_have_association_compliance_status_of_compliant.sql")
    }
    check "4" {
      title = "SSM documents should not be public"
      query = file("queries/ssm/documents_should_not_be_public.sql")
    }
  }