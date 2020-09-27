WITH source AS (
    SELECT * FROM {{ source('website', 'WEB_SALES')}}
    LIMIT 10000 -- Limiting due to data limitation via Trial Account
)

SELECT * FROM source