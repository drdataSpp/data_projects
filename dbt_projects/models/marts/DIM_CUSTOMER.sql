with cte_dim_customer as 
(
    select *
    from {{ ref('stg_customer') }}
)

select * from cte_dim_customer;