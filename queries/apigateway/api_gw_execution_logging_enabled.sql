SELECT
	distinct 'arn:'|| 'aws'||':apigateway:'||region||':/restapis/'|| id as arn,
	aws_apigateway_rest_apis.name
FROM
    (
        SELECT
            *
        FROM
            api_gateway_method_settings
        WHERE
            logging_level NOT IN ('ERROR', 'INFO')
    ) as t
	left join aws_apigateway_rest_apis on t.rest_api_cq_id = aws_apigateway_rest_apis.cq_id
UNION

SELECT distinct 
	'arn:' || 'aws'||':apigateway:'||region||':/apis/'|| id as arn,
	aws_apigatewayv2_apis.name
	
FROM
    aws_apigatewayv2_api_stages
	left join aws_apigatewayv2_apis on aws_apigatewayv2_api_stages.api_cq_id = aws_apigatewayv2_apis.cq_id
WHERE
    route_settings_logging_level IN (NULL, 'OFF')