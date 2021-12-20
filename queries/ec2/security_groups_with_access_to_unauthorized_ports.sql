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
  or from_port is distinct from 80
    or to_port is distinct from 80
  or from_port is distinct from 443
    or to_port is distinct from 443;