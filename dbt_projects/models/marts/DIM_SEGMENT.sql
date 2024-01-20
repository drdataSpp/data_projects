with cte_dim_segments as 
(
    select *
    from {{ ref('stg_segment') }}
)

select * from cte_dim_segments;