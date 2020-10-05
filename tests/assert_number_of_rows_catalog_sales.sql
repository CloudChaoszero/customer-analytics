SELECT
    order_number,
    COUNT(*) AS total_rows
FROM {{ ref('catalog_sales_fct' )}}
GROUP BY 1
HAVING not(total_rows >= 0)