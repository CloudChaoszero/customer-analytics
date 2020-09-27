WITH source AS (
    SELECT * FROM {{ source('customers', 'INCOME_BAND')}}
)

SELECT * FROM source