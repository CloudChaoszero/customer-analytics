WITH source AS (

    SELECT * FROM {{ ref('catalog_sales_fct') }}


)
SELECT
    DATE_TRUNC('month',
        customer_sales_sold_date) AS customer_sales_sold_date_month,
    income_band_bound,
    SUM(quantity) total_quantity,
    SUM(wholesale_cost) AS total_wholesale_cost,
    SUM(sales_price) AS total_sales_price
FROM 
    source
GROUP BY 
    customer_sales_sold_date_month,
    income_band_bound
ORDER BY
    customer_sales_sold_date_month ASC,
    income_band_bound DESC