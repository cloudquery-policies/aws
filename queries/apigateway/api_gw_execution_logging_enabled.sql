SELECT
DISTINCT
    'arn:' || 'aws' || ':apigateway:' || region || ':/restapis/' || id AS arn,
    aws_apigateway_rest_apis.name
FROM
    (
        SELECT
            *
        FROM
            api_gateway_method_settings
        WHERE
            logging_level NOT IN ('ERROR', 'INFO')
    ) AS t
    LEFT JOIN
        aws_apigateway_rest_apis ON
            t.rest_api_cq_id = aws_apigateway_rest_apis.cq_id
UNION

SELECT DISTINCT
    'arn:' || 'aws' || ':apigateway:' || region || ':/apis/' || id AS arn,
    aws_apigatewayv2_apis.name

FROM
    aws_apigatewayv2_api_stages
    LEFT JOIN
        aws_apigatewayv2_apis ON
            aws_apigatewayv2_api_stages.api_cq_id = aws_apigatewayv2_apis.cq_id
WHERE
    route_settings_logging_level IN (NULL, 'OFF')
