/*
    * This is an example of considerations for BASE layer implementation in 
    * the dbt Tutorial I created.
    * It includes the following considerations in changes for BASE layer:
        * Explicity Data types
        * Calling a segment of columns
        * Column Renaming
*/
WITH source AS (
    SELECT * FROM {{ source('customers', 'CATALOG_SALES')}}
    LIMIT 10000000 -- Limiting due to data limitation via Trial Account :(
),

-- Explicitly defining data types & potential renaming
data_type_rename_conversion AS (
    
    SELECT
        CS_SOLD_DATE_SK::NUMBER AS CS_SOLD_DATE_SK,
        CS_SOLD_TIME_SK::NUMBER AS CS_SOLD_TIME_SK, 
        CS_SHIP_DATE_SK::NUMBER AS CS_SHIP_DATE_SK,
        CS_BILL_CUSTOMER_SK::NUMBER AS CS_BILL_CUSTOMER_SK,
        CS_BILL_CDEMO_SK::NUMBER AS CS_BILL_CDEMO_SK,
        CS_BILL_HDEMO_SK::NUMBER AS CS_BILL_HDEMO_SK,
        CS_BILL_ADDR_SK::NUMBER AS CS_BILL_ADDR_SK,
        /* We'll look at this later, 
            about including after creating MVP mode
        */
        -- CS_SHIP_CUSTOMER_SK::NUMBER AS CS_SHIP_CUSTOMER,
        -- CS_SHIP_CDEMO_SK::NUMBER AS CS_SHIP_CDEMO,
        -- CS_SHIP_HDEMO_SK::NUMBER AS CS_SHIP_HDEMO,
        -- CS_SHIP_ADDR_SK::NUMBER AS CS_SHIP_ADDR,
        -- CS_SHIP_MODE_SK::NUMBER AS CS_SHIP_MODE_SK,
        CS_CALL_CENTER_SK::NUMBER AS CS_CALL_CENTER_SK,
        CS_CATALOG_PAGE_SK::NUMBER AS CS_CATALOG_PAGE_SK,
        CS_WAREHOUSE_SK::NUMBER AS CS_WAREHOUSE_SK,
        CS_ITEM_SK::NUMBER AS CS_ITEM_SK,
        CS_PROMO_SK::NUMBER AS CS_PROMO_SK,
        CS_ORDER_NUMBER::NUMBER AS CS_ORDER_NUMBER,
        CS_QUANTITY::NUMBER AS CS_QUANTITY,
        CS_WHOLESALE_COST::NUMBER AS CS_WHOLESALE_COST,
        CS_LIST_PRICE::NUMBER AS CS_LIST_PRICE,
        CS_SALES_PRICE::NUMBER AS CS_SALES_PRICE,
        CS_EXT_DISCOUNT_AMT::NUMBER AS CS_EXT_DISCOUNT_AMT,
        CS_EXT_SALES_PRICE::NUMBER AS CS_EXT_SALES_PRICE,
        CS_EXT_WHOLESALE_COST::NUMBER AS CS_EXT_WHOLESALE_COST,
        CS_EXT_LIST_PRICE::NUMBER AS CS_EXT_LIST_PRICE,
        CS_EXT_TAX::NUMBER AS CS_EXT_TAX,
        CS_COUPON_AMT::NUMBER AS CS_COUPON_AMT,
        CS_EXT_SHIP_COST::NUMBER AS CS_EXT_SHIP_COST,
        CS_NET_PAID::NUMBER AS CS_NET_PAID,
        CS_NET_PAID_INC_TAX::NUMBER AS CS_NET_PAID_INC_TAX,
        CS_NET_PAID_INC_SHIP::NUMBER AS CS_NET_PAID_INC_SHIP,
        CS_NET_PAID_INC_SHIP_TAX::NUMBER AS CS_NET_PAID_INC_SHIP_TAX,
        CS_NET_PROFIT::NUMBER AS CS_NET_PROFIT
  FROM source

)

SELECT * FROM data_type_rename_conversion