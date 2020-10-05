-- If we wanted to do any future enrichment, we could do it in this layer.
WITH source AS (

    SELECT * FROM {{ ref('stg_customer_catalog_sales') }}

),

final AS (

    SELECT 
    
         catalog_sales.*,
        -- X $Dollars * (British Pounds / $Dollars)
        net_amount * (.77/1) AS net_amount_british_pounds,
        net_amount_british_pounds / quantity AS net_amount_per_order_unit_british_pounds
    
    FROM source AS catalog_sales

)

SELECT * FROM final