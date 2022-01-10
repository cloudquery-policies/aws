policy "cis-v1.20" {
  title = "AWS CIS V1.20 Policy"
  doc   = file("cis_v1.2.0/README.md")
  configuration {
    provider "aws" {
      version = "~> 0.9.0"
    }
  }

  view "aws_log_metric_filter_and_alarm" {
    title = "AWS Log Metric Filter and Alarm"
    query = file("queries/cloudwatch/log_metric_filter_and_alarm_view.sql")
  }

  policy "1" {
    source = file("cis_v1.2.0/section_1.hcl")
  }

  policy "2" {
    source = file("cis_v1.2.0/section_2.hcl")
  }

  policy "3" {
    source = file("cis_v1.2.0/section_3.hcl")
  }

  policy "4" {
    source = file("cis_v1.2.0/section_4.hcl")
  }
}
