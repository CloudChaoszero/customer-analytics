WITH source AS (
    SELECT * FROM {{ source('website', 'WEB_RETURNS')}}
    LIMIT 10000 -- Limiting due to data limitation via Trial Account
)

SELECT * FROM source