{{ config(materialized='table') }}

with cte_fct_superstore as 
(
    select 
        CAST(Order_ID AS VARCHAR(255)) 		AS ORDER_NK,
        Order_Date 		                    AS ORDER_DATE,
        Ship_Date		                    AS SHIP_DATE,
        CAST(Ship_Mode AS VARCHAR(255)) 	AS SHIP_MODE,
        Customer_ID							AS CUSTOMER_ID,
        Segment								AS CUSTOMER_SEGMENT,
        CAST(City AS VARCHAR(500))			AS CITY_NAME,
        Product_ID							AS PRODUCT_NK,	
        CAST(Sales AS DECIMAL(10, 2))		AS TOTAL_SALES,
        CAST(Quantity AS INT)				AS TOTAL_QUANTITY,
        CAST(Discount AS DECIMAL(10, 2))	AS DISCOUNT,
        CAST(Profit AS DECIMAL(10, 2))		AS TOTAL_PROFIT
    from {{ source('RAW_SuperStore_tbl', 'RAW_SuperStore')}}
)

select * from cte_fct_superstore;