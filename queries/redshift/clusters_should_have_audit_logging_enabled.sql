SELECT account_id,
       id,
       region
FROM aws_redshift_clusters
WHERE
    jsonb_typeof(logging_status -> 'LoggingEnabled') IS NULL
    OR (
        jsonb_typeof(logging_status -> 'LoggingEnabled') IS NOT NULL
        AND (logging_status -> 'LoggingEnabled')::BOOLEAN IS FALSE
    );
