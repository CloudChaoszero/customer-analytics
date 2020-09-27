WITH source AS (
    SELECT * FROM {{ source('misc', 'DATE_DIM')}}
)

SELECT * FROM source