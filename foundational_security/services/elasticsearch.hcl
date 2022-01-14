policy "elasticsearch" {
  title = "Elasticsearch controls"
  doc   = file("foundational_security/docs/Elasticsearch.md")
  check "Elasticsearch.1" {
    title = "Elasticsearch domains should have encryption at rest enabled"
    query = file("queries/elasticsearch/elasticsearch_domains_should_have_encryption_at_rest_enabled.sql")
    doc   = file("foundational_security/docs/Elasticsearch.1.md")
  }

  check "Elasticsearch.2" {
    title = "Elasticsearch domains should be in a VPC"
    query = file("queries/elasticsearch/elasticsearch_domains_should_be_in_vpc.sql")
    doc   = file("foundational_security/docs/Elasticsearch.2.md")
  }

  check "Elasticsearch.3" {
    title = "Elasticsearch domains should encrypt data sent between nodes"
    query = file("queries/elasticsearch/elasticsearch_domains_should_encrypt_data_sent_between_nodes.sql")
    doc   = file("foundational_security/docs/Elasticsearch.3.md")
  }

  check "Elasticsearch.4" {
    title = "Elasticsearch domain error logging to CloudWatch Logs should be enabled"
    query = file("queries/elasticsearch/elasticsearch_domain_error_logging_to_cloudwatch_logs_should_be_enabled.sql")
    doc   = file("foundational_security/docs/Elasticsearch.4.md")
  }

  check "Elasticsearch.5" {
    title = "Elasticsearch domains should have audit logging enabled"
    query = file("queries/elasticsearch/elasticsearch_domains_should_have_audit_logging_enabled.sql")
    doc   = file("foundational_security/docs/Elasticsearch.5.md")
  }

  check "Elasticsearch.6" {
    title = "Elasticsearch domains should have at least three data nodes"
    query = file("queries/elasticsearch/elasticsearch_domains_should_have_at_least_three_data_nodes.sql")
    doc   = file("foundational_security/docs/Elasticsearch.6.md")
  }

  check "Elasticsearch.7" {
    title = "Elasticsearch domains should be configured with at least three dedicated master nodes"
    query = file("queries/elasticsearch/elasticsearch_domains_should_be_configured_with_at_least_three_dedicated_master_nodes.sql")
    doc   = file("foundational_security/docs/Elasticsearch.7.md")
  }

  check "Elasticsearch.8" {
    title = "Connections to Elasticsearch domains should be encrypted using TLS 1.2"
    query = file("queries/elasticsearch/connections_to_elasticsearch_domains_should_be_encrypted_using_tls_1_2.sql")
    doc   = file("foundational_security/docs/Elasticsearch.8.md")
  }
}