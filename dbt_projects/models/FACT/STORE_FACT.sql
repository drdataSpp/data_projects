with cte_fact as
(
    select
        src.INVOICE_ID                                  
        ,coalesce(sk_prod.Product_line_sk, -1)          as PRODUCT_LINE_SK
        ,coalesce(sk_cust_type.Customer_Type_sk, -1)   as CUSTOMER_TYPE_SK
        ,coalesce(sk_payment.Payment_sk, -1)            as PAYMENT_SK
        ,src.BRANCH                                     
        ,src.CITY
        ,src.GENDER
        ,src.UNIT_PRICE
        ,src.QUANTITY
        ,src.TAX_RATE
        ,src.TOTAL
        ,src.DATE_OF_PURCHASE
        ,src.TIME_OF_PURCHASE
        ,src.COGS
        ,src.GROSS_MARGIN_PERCENTAGE
        ,src.GROSS_INCOME
        ,src.RATING
    from {{ref('SALES_TBL')}} as src

    left join {{ref('SK_PRODUCT_LINE_MAP')}} as sk_prod
        on sk_prod.Source_value = src.PRODUCT_LINE

    left join {{ref('SK_CUSTOMER_TYPE_MAP')}} as sk_cust_type
        on sk_cust_type.Source_value = src.CUSTOMER_TYPE

    left join {{ref('SK_PAYMENT_TYPE_MAP')}} as sk_payment
        on sk_payment.Source_value = src.PAYMENT
)

select
    INVOICE_ID					as SALES_INVOICE_ID                    	              
    ,PRODUCT_LINE_SK			as PRODUCT_LINE_SK
    ,CUSTOMER_TYPE_SK			as CUSTOMER_TYPE_SK
    ,PAYMENT_SK					as PAYMENT_SK
    ,BRANCH						as SALES_BRANCH   
    ,CITY						as SALES_CITY
    ,DATE_OF_PURCHASE			as DATE_OF_SALES
    ,TIME_OF_PURCHASE			as TIME_OF_SALES
    ,GENDER						as CUSTOMER_GENDER
    ,RATING						as CUSTOMER_RATING
    ,UNIT_PRICE					as PRODUCT_UNIT_PRICE
    ,QUANTITY					as SALES_QUANTITY
    ,TAX_RATE					as SALES_TAX_AMT
    ,COGS						as COST_OF_GOODS
    ,TOTAL						as TOTAL_SALES_VAL
    ,GROSS_MARGIN_PERCENTAGE 	as SALES_GROSS_MARGIN_PERC	
    ,GROSS_INCOME			 	as SALES_GROSS_INCOME
from cte_fact