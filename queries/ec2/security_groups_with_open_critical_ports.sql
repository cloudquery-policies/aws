-- uses view which uses aws_security_group_ingress_rules.sql query
SELECT account_id,
       region,
       group_name,
       id,
       from_port,
       to_port,
       ip_protocol,
       ip,
       'adjust rules so that the internet only has access to ports 80 and 443' as cq_reason
FROM aws_security_group_ingress_rules
WHERE (ip = '0.0.0.0/0' OR ip = '::/0')
    AND (from_port IS NULL AND to_port IS NULL) -- all prots
    OR 20 BETWEEN from_port AND to_port
    OR 21 BETWEEN from_port AND to_port
    OR 22 BETWEEN from_port AND to_port
    OR 23 BETWEEN from_port AND to_port
    OR 25 BETWEEN from_port AND to_port
    OR 110 BETWEEN from_port AND to_port
    OR 135 BETWEEN from_port AND to_port
    OR 143 BETWEEN from_port AND to_port
    OR 445 BETWEEN from_port AND to_port
    OR 1433 BETWEEN from_port AND to_port
    OR 1434 BETWEEN from_port AND to_port
    OR 3000 BETWEEN from_port AND to_port
    OR 3306 BETWEEN from_port AND to_port
    OR 3389 BETWEEN from_port AND to_port
    OR 4333 BETWEEN from_port AND to_port
    OR 5000 BETWEEN from_port AND to_port
    OR 5432 BETWEEN from_port AND to_port
    OR 5500 BETWEEN from_port AND to_port
    OR 5601 BETWEEN from_port AND to_port
    OR 8080 BETWEEN from_port AND to_port
    OR 8088 BETWEEN from_port AND to_port
    OR 8888 BETWEEN from_port AND to_port
    OR 9200 BETWEEN from_port AND to_port
    OR 9300 BETWEEN from_port AND to_port
