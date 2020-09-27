WITH source AS (
    SELECT * FROM {{ ref('stg_household_demographics') }}
)

SELECT * FROM source