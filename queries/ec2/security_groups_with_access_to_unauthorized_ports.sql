-- uses view which uses aws_security_group_ingress_rules.sql query
SELECT account_id,
       region,
       group_name,
       id,
       from_port,
       to_port,
       ip_protocol,
       ip
FROM aws_security_group_ingress_rules
WHERE (ip = '0.0.0.0/0' OR ip = '::/0')
    AND (from_port IS NULL AND to_port IS NULL) -- all prots
    OR from_port IS DISTINCT FROM 80
    OR to_port IS DISTINCT FROM 80
    OR from_port IS DISTINCT FROM 443
    OR to_port IS DISTINCT FROM 443;
