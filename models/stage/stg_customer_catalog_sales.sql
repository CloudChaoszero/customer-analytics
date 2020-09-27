WITH catalog_sales_source AS (
    SELECT
        cs_sold_date_sk,
        cs_sold_time_sk,
        cs_ship_date_sk,
        cs_item_sk,
        cs_order_number,
        cs_quantity,
        cs_bill_hdemo_sk,
        cs_wholesale_cost,
        cs_list_price,
        cs_sales_price,
        cs_ext_discount_amt,
        cs_ext_sales_price,
        cs_ext_wholesale_cost,
        cs_ext_list_price,
        cs_ext_tax,
        cs_coupon_amt,
        cs_ext_ship_cost,
        cs_net_paid,
        cs_net_paid_inc_tax,
        cs_net_paid_inc_ship,
        cs_net_paid_inc_ship_tax,
        cs_net_profit 
    FROM 
        {{ ref('snowflake_demo_catalog_sales') }}
),


-- Note: Could refer optimize by specifying columns to JOIN on.
household_demographics_source AS (
    SELECT * FROM {{ ref('stg_household_demographics') }}
),

date_ref AS (
    SELECT * FROM {{ ref('snowflake_demo_dates') }}
),

time_ref AS (
    SELECT * FROM {{ ref('snowflake_demo_times') }}
),

final AS (
    
    SELECT 
        dates.d_date AS customer_sales_sold_date,
        dates2.t_am_pm AS customer_sales_sold_time_am_pm,
        dates2.t_sub_shift AS customer_sales_sold_time_sub_shift,
        dates3.d_date AS customer_sales_ship_date,
        COALESCE(hd.income_band_bound,
            'Unidentified') AS income_band_bound,
        hd.hd_buy_potential AS household_buy_potential,
        cs.cs_item_sk AS item_sk,
        cs.cs_order_number AS order_number,
        cs.cs_quantity AS quantity,
        cs.cs_wholesale_cost AS wholesale_cost,
        cs.cs_list_price AS list_price,
        cs.cs_sales_price AS sales_price,
        cs.cs_ext_discount_amt AS ext_discount_amount,
        cs.cs_ext_sales_price AS ext_sales_price,
        cs.cs_ext_wholesale_cost AS ext_wholesale_cost,
        cs.cs_ext_list_price AS ext_list_price,
        cs.cs_ext_tax AS ext_tax,
        cs.cs_coupon_amt AS coupon_amount,
        cs.cs_ext_ship_cost AS ext_ship_cost,
        cs.cs_net_paid AS net_paid,
        cs.cs_net_paid_inc_tax AS net_paid_income_tax,
        cs.cs_net_paid_inc_ship AS net_paid_income_ship,
        cs.cs_net_paid_inc_ship_tax net_paid_income_ship_tax,
        cs.cs_net_profit AS net_amount 
    FROM 
        catalog_sales_source AS cs
    
    LEFT JOIN 
        date_ref AS dates
    ON 
        cs.cs_sold_date_sk = dates.d_date_sk
    LEFT JOIN 
        time_ref AS dates2
    ON 
        cs.cs_sold_time_sk = dates2.t_time_sk
    LEFT JOIN 
                date_ref AS dates3
    ON 
        cs.cs_ship_date_sk = dates3.d_date_sk
    LEFT JOIN 
        household_demographics_source AS hd
    ON 
        cs.cs_bill_hdemo_sk = hd.hd_demo_sk

)

SELECT * FROM final