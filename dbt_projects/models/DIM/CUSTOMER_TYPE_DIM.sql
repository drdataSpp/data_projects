with cte_cust_type_dim as
(
    select
        Customer_Type_sk        as CUSTOMER_TYPE_SK
        ,Source_value           as CUSTOMER_TYPE_DESC
    from {{ref('SK_CUSTOMER_TYPE_MAP')}}
)

select * from cte_cust_type_dim