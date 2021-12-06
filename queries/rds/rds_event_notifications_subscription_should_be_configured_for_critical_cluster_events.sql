SELECT
  db_cluster_arn
FROM
  aws_rds_clusters
  LEFT OUTER JOIN
  (
    SELECT source_id, array_agg(category) AS categories
    FROM
      aws_rds_event_subscriptions,
      unnest(source_ids_list) AS source_id,
      unnest(event_categories_list) AS category
    WHERE source_type = 'db-cluster'
    GROUP BY source_id
   ) cats
   ON db_cluster_identifier = cats.source_id
WHERE
  categories IS NULL
  OR NOT categories @> '{"failure", "maintenance"}'
