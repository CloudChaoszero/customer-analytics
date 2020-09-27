WITH source AS (
    SELECT * FROM  {{ ref('snowflake_demo_income_band') }}
),

final AS (

    SELECT
        ib_income_band_sk AS income_band_sk,
        ib_lower_bound || '-' || ib_upper_bound AS income_band_bound
    FROM source
)

SELECT * FROM final