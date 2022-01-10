WITH any_category AS (
    SELECT DISTINCT TRUE AS any_category
    FROM aws_rds_event_subscriptions
    WHERE
        (source_type IS NULL OR source_type = 'db-instance')
        AND event_categories_list IS NULL
), any_source_id AS (
    SELECT COALESCE(array_agg(category), '{}'::TEXT[]) AS any_source_categories
    FROM
        aws_rds_event_subscriptions,
        unnest(event_categories_list) AS category
    WHERE
        source_type = 'db-instance'
        AND event_categories_list IS NOT NULL
), specific_categories AS (
    SELECT source_id, array_agg(category) AS specific_cats
    FROM
        aws_rds_event_subscriptions,
        unnest(source_ids_list) AS source_id,
        unnest(event_categories_list) AS category
    WHERE source_type = 'db-instance'
    GROUP BY source_id
)
SELECT
    i.arn
FROM
    aws_rds_instances i
    LEFT OUTER JOIN any_category ON TRUE
    JOIN any_source_id ON TRUE
    LEFT OUTER JOIN
        specific_categories ON user_instance_id = specific_categories.source_id
WHERE
    any_category IS NOT TRUE
    AND NOT any_source_categories @> '{"maintenance","configuration change","failure"}'
    AND (
        specific_cats IS NULL OR NOT specific_cats @> '{"maintenance","configuration change","failure"}'
    )
