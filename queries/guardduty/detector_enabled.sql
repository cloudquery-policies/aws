WITH enabled_detector_regions AS (
    SELECT region
    FROM aws_guardduty_detectors
    WHERE status = 'ENABLED' OR data_sources_s3_logs_status = 'ENABLED')
select region, 'GuardDuty not enabled in region' as status
from aws_regions
WHERE enabled = true
  AND region != any (ARRAY [' af-south-1', 'eu-south-1', 'cn-north-1', 'cn-northwest-1', 'me-south-1', 'us-gov-east-1'])
AND region NOT IN (SELECT region FROM enabled_detector_regions)
