WITH enabled_detector_regions AS (
    SELECT region
    FROM aws_guardduty_detectors
    WHERE status = 'ENABLED'
)

SELECT account_id, region, 'n/a' AS id,
   format('GuardDuty not enabled in %s', region) as cq_reason

FROM aws_regions
WHERE enabled = TRUE
      AND region NOT IN (SELECT region FROM enabled_detector_regions)
UNION
-- Add any detector that is enabled but all data sources are disabled
SELECT account_id, region, id, 'no detectors are enabled' as cq_reason FROM aws_guardduty_detectors
WHERE
    status = 'ENABLED'
    AND (
        data_sources_s3_logs_status != 'ENABLED' AND data_sources_cloud_trail_status != 'ENABLED'
        AND data_sources_dns_logs_status != 'ENABLED' AND data_sources_flow_logs_status != 'ENABLED'
    )
