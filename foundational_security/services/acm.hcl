policy "acm" {
  title = "acm controls"
  doc   = file("foundational_security/docs/ACM.md")
  check "ACM.1" {
    title = "Imported ACM certificates should be renewed after a specified time period"
    query = file("queries/acm/certificates_should_be_renewed.sql")
    doc   = file("foundational_security/docs/ACM.1.md")
  }
}