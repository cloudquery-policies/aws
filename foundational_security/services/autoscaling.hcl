policy "autoscaling" {
  title = "autoscaling controls"
  doc   = file("foundational_security/docs/AutoScaling.md")
  check "AutoScaling.1" {
    query = file("queries/autoscaling/autoscaling_groups_elb_check.sql")
    doc   = file("foundational_security/docs/AutoScaling.1.md")
  }
}