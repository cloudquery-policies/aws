policy "guardduty" {
  title = "GuardDuty controls"
  doc   = file("foundational_security/docs/GuardDuty.md")
  check "GuardDuty.1" {
    title = "GuardDuty should be enabled"
    query = file("queries/guardduty/detector_enabled.sql")
    doc   = file("foundational_security/docs/GuardDuty.1.md")
  }
}