with sk_customer_type_tbl as
(
    select distinct Customer_type as Customer_type
    from {{ref('SALES_TBL')}}
)

select 
    cast(row_number() OVER (ORDER BY Customer_type ASC) as integer) AS Customer_Type_sk
    ,cast(Customer_Type as varchar(255)) as Source_value
from sk_customer_type_tbl
order by 2