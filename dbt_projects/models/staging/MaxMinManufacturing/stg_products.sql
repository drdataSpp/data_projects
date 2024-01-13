with cte_products as 
(
    select 
        Product_ID                              as PRODUCT_ID_NK,
        CAST(Product_Name AS VARCHAR(500))      as PRODUCT_NAME,
        Category                                as PRODUCT_CATEGORY,
        Sub_Category                            as PRODUCT_SUB_CATEGORY
    from {{ source('RAW_SuperStore_tbl', 'RAW_SuperStore')}}
    --adding group by clause to filter dups
    group by Product_ID, Product_Name, Category, Sub_Category
)

select * from cte_products;