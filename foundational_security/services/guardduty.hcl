policy "guardduty" {
  title = "GuardDuty controls"
  check "GuardDuty.1" {
    title = "GuardDuty should be enabled"
    query = file("queries/guardduty/detector_enabled.sql")
  }
}