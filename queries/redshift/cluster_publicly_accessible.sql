SELECT account_id, region, id AS resource_identifier 
    FROM aws_redshift_clusters 
WHERE publicly_accessible IS TRUE;