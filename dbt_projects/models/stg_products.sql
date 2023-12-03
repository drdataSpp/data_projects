with cte_products as 
(
    select ProductCode as product_id,
     ProductName
    from [dbo].[DimProduct]
)

select * from cte_products;