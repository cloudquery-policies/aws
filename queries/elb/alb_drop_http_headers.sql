SELECT lb.account_id, lb.region, lb.name FROM aws_elbv2_load_balancers lb
    JOIN
        aws_elbv2_load_balancer_attributes a ON a.load_balancer_cq_id = lb.cq_id
WHERE
    lb.type = 'application' AND a.routing_http_drop_invalid_header_fields IS NOT TRUE
;
