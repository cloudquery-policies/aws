policy "config" {
  title = "AWS config controls"
  doc   = file("foundational_security/docs/Config.md")
  check "Config.1" {
    title = "AWS Config should be enabled"
    query = file("queries/config/enabled_all_regions.sql")
    doc   = file("foundational_security/docs/Config.1.md")
  }
}