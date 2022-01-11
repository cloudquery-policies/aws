policy "config" {
  title = "AWS config controls"
  check "Config.1" {
    title = "AWS Config should be enabled"
    query = file("queries/config/enabled_all_regions.sql")
  }
}