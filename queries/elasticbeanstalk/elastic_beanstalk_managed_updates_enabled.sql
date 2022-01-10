SELECT application_arn,
    option_name,
    value
FROM aws_elasticbeanstalk_configuration_setting_options
    LEFT JOIN
        aws_elasticbeanstalk_configuration_settings ON
            aws_elasticbeanstalk_configuration_setting_options.configuration_setting_cq_id =
            aws_elasticbeanstalk_configuration_settings.cq_id
WHERE option_name = 'ManagedActionsEnabled'
    AND value::BOOLEAN IS DISTINCT
    FROM TRUE
