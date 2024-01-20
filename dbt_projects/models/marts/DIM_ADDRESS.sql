with cte_dim_address as 
(
    select *
    from {{ ref('stg_address') }}
)

select * from cte_dim_address;