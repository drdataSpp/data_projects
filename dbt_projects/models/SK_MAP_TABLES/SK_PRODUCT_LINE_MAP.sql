with sk_product_line_tbl as
(
    select distinct Product_line as Product_line
    from {{ref('SALES_TBL')}}
)

select 
    cast(row_number() OVER (ORDER BY Product_line ASC) as integer) AS Product_line_sk
    ,cast(Product_line as varchar(255)) as Source_value
from sk_product_line_tbl
order by 2