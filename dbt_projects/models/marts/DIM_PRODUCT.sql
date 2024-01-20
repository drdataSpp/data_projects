with cte_dim_products as 
(
    select *
    from {{ ref('stg_products') }}
)

select * from cte_dim_products;