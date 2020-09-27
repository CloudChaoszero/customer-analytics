WITH source AS (
    SELECT * FROM  {{ ref('snowflake_demo_customer') }}
)

SELECT * FROM source