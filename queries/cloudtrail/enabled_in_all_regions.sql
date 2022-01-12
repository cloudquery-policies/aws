SELECT
    aws_cloudtrail_trails.account_id,
    arn,
    is_multi_region_trail,
    read_write_type,
    include_management_events
FROM aws_cloudtrail_trails
    JOIN
        aws_cloudtrail_trail_event_selectors ON
            aws_cloudtrail_trails.cq_id =
            aws_cloudtrail_trail_event_selectors.trail_cq_id
WHERE
    is_multi_region_trail = FALSE OR (
        is_multi_region_trail = TRUE AND (
            read_write_type != 'All' OR include_management_events = FALSE
        )
    )
