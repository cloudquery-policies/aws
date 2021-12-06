SELECT
  i.arn
FROM
  aws_rds_instances i
  LEFT OUTER JOIN
  (
    SELECT source_id, array_agg(category) AS categories
    FROM
      aws_rds_event_subscriptions,
      unnest(source_ids_list) AS source_id,
      unnest(event_categories_list) AS category
    WHERE source_type = 'db-instance'
    GROUP BY source_id
   ) cats
   ON user_instance_id = cats.source_id
WHERE
  categories IS NULL
  OR NOT categories @> '{"configuration change","failure","maintenance"}'
