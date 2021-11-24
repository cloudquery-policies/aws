WITH enabled_detector_regions AS (
    SELECT region
    FROM aws_guardduty_detectors
    WHERE status = 'ENABLED')
select account_id, region, 'GuardDuty not enabled in region' as id
from aws_regions
WHERE enabled = true
  AND region NOT IN (SELECT region FROM enabled_detector_regions)
UNION
-- Add any detector that is enabled but all data sources are disabled
SELECT account_id, region, id from aws_guardduty_detectors
    WHERE status = 'ENABLED'  AND (
        data_sources_s3_logs_status != 'ENABLED' AND data_sources_cloud_trail_status != 'ENABLED'
            AND data_sources_dns_logs_status != 'ENABLED' AND data_sources_flow_logs_status != 'ENABLED')