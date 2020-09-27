WITH source AS (
    SELECT * FROM {{ source('misc', 'TIME_DIM')}}
)

SELECT * FROM source