with cte_customer as 
(
    select distinct
        Customer_ID                                   as CUSTOMER_ID
        ,CAST(Customer_Name AS VARCHAR(500))          as CUSTOMER_NAME
    from {{ source('RAW_SuperStore_tbl', 'RAW_SuperStore')}}
)

select * from cte_customer;