WITH source AS (
    SELECT * FROM {{ source('customers', 'HOUSEHOLD_DEMOGRAPHICS')}}
)

SELECT * FROM source