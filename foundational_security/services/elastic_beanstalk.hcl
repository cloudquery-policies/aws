policy "elastic_beanstalk" {
  title = "ElasticBeanstalk controls"
  doc   = file("foundational_security/docs/elasticbeanstalk.md")
  check "ElasticBeanstalk.1" {
    title = "Elastic Beanstalk environments should have enhanced health reporting enabled"
    query = file("queries/elasticbeanstalk/advanced_health_reporting_enabled.sql")
    doc   = file("foundational_security/docs/elasticbeanstalk.1.md")
  }

  check "ElasticBeanstalk.2" {
    title = "Elastic Beanstalk managed platform updates should be enabled"
    query = file("queries/elasticbeanstalk/elastic_beanstalk_managed_updates_enabled.sql")
    doc   = file("foundational_security/docs/elasticbeanstalk.2.md")
  }
}