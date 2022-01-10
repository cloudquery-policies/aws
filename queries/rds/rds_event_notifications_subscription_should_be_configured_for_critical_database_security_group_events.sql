WITH any_category AS (
    SELECT DISTINCT TRUE AS any_category
    FROM aws_rds_event_subscriptions
    WHERE
        (source_type IS NULL OR source_type = 'db-security-group')
        AND event_categories_list IS NULL
), any_source_id AS (
    SELECT COALESCE(array_agg(category), '{}'::TEXT[]) AS any_source_categories
    FROM
        aws_rds_event_subscriptions,
        unnest(event_categories_list) AS category
    WHERE
        source_type = 'db-security-group'
        AND event_categories_list IS NOT NULL
), specific_categories AS (
    SELECT source_id, array_agg(category) AS specific_cats
    FROM
        aws_rds_event_subscriptions,
        unnest(source_ids_list) AS source_id,
        unnest(event_categories_list) AS category
    WHERE source_type = 'db-security-group'
    GROUP BY source_id
)
SELECT
    s.arn
FROM
    aws_rds_db_security_groups s
    LEFT OUTER JOIN any_category ON TRUE
    JOIN any_source_id ON TRUE
    LEFT OUTER JOIN
        specific_categories ON s.name = specific_categories.source_id
WHERE
    any_category IS NOT TRUE
    AND NOT any_source_categories @> '{"configuration change","failure"}'
    AND (
        specific_cats IS NULL OR NOT specific_cats @> '{"configuration change","failure"}'
    )
