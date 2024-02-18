with cte_prod_line_dim as
(
    select
        Product_line_sk     as PRODUCT_LINE_SK
        ,Source_value       as PRODUCT_LINE_DESC
    from {{ref('SK_PRODUCT_LINE_MAP')}}
)

select * from cte_prod_line_dim