policy "guardduty" {
  title = "GuardDuty controls"
  doc   = file("foundational_security/docs/guardduty.md")
  check "GuardDuty.1" {
    title = "GuardDuty should be enabled"
    query = file("queries/guardduty/detector_enabled.sql")
    doc   = file("foundational_security/docs/guardduty.1.md")
  }
}