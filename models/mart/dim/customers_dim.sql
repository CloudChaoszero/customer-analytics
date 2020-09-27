WITH source AS (
    SELECT * FROM  {{ ref('stg_customers') }}
)

SELECT * FROM source