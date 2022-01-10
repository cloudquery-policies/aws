SELECT account_id,
       id,
       region
FROM aws_redshift_clusters
WHERE allow_version_upgrade IS FALSE
      OR allow_version_upgrade IS NULL;
