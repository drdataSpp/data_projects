with cte_products as 
(
    select ProductCode as product_id,
     ProductName
    from {{ source('max_min_sales', 'DimProduct')}}
)

select * from cte_products;