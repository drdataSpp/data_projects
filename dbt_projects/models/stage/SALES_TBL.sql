with cte_src_sales_tbl as
(
    select *
    from {{ source('Sales_Src', 'Sales') }}
)

select 
    *
from cte_src_sales_tbl