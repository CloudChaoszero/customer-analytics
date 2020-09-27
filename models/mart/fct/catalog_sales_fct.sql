-- If we wanted to do any future enrichment, we could do it in this layer.
WITH source AS (

    SELECT * FROM {{ ref('stg_customer_catalog_sales') }}

)

SELECT * FROM source