SELECT account_id,
       id,
       region
FROM aws_redshift_clusters
WHERE enhanced_vpc_routing IS FALSE
   OR enhanced_vpc_routing IS NULL;