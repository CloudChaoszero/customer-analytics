WITH source AS (
    SELECT * FROM {{ source('customers', 'STORE_SALES')}}
    LIMIT 10000 -- Limiting due to data limitation via Trial Account
)

SELECT * FROM source