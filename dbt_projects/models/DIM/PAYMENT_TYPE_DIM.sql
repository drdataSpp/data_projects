with cte_payment_type_dim as
(
    select
        Payment_sk      as PAYMENT_TYPE_SK
        ,Source_value   as PAYMENT_TYPE_DESC
    from {{ref('SK_PAYMENT_TYPE_MAP')}}
)

select * from cte_payment_type_dim