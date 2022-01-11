policy "acm" {
  title = "acm controls"
  check "ACM.1" {
    title = "Imported ACM certificates should be renewed after a specified time period"
    query = file("queries/acm/certificates_should_be_renewed.sql")
  }
}