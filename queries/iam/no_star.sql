with violations as (
    select
        policy_cq_id,
        count(*) as violations
    from
        aws_iam_policy_versions,
        jsonb_array_elements(document -> 'Statement') as statement,
        jsonb_array_elements_text(
                case jsonb_typeof(statement -> 'Resource') when 'string' then jsonb_build_array(statement ->> 'Resource') when 'array' then statement -> 'Resource' end
            ) as resource,
        jsonb_array_elements_text(
                case jsonb_typeof(statement -> 'Action') when 'string' then jsonb_build_array(statement ->> 'Action') when 'array' then statement -> 'Action' end
            ) as action
    where
                statement ->> 'Effect' = 'Allow'
      and resource = '*'
      and (
                action = '*'
            or action = '*:*'
        )
    group by
        policy_cq_id
)
select
    account_id,
    arn,
    id,
    name,
    violations
from
    aws_iam_policies
        join violations on violations.policy_cq_id = aws_iam_policies.cq_id
