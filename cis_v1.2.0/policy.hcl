policy "cis-v1.20" {
  name = "AWS CIS V1.20 Policy"
  description = file("cis_v1.2.0/README.md")
  configuration {
    provider "aws" {
      version = ">= 0.5.0"
    }
  }

  view "aws_log_metric_filter_and_alarm" {
    name = "AWS Log Metric Filter and Alarm"
    query "aws_log_metric_filter_and_alarm_query" {
      query = file("queries/cloudwatch/log_metric_filter_and_alarm_view.sql")
    }
  }

  policy "1" {
    name = "Section 1: Identity and Access Management"
    source      = file("cis_v1.2.0/section_1.hcl")
  }

  policy "2" {
    name = "Section 2: Logging"
    source      = file("cis_v1.2.0/section_2.hcl")
  }

  policy "3" {
    name = "Section 3: Monitoring"
    source      = file("cis_v1.2.0/section_3.hcl")
  }

  policy "4" {
    description = "Section 4: Networking"
    source      = file("cis_v1.2.0/section_4.hcl")
  }
}
