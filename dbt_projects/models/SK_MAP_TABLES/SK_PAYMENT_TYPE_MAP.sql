with sk_payment_tbl as
(
    select distinct payment as Payment
    from {{ref('SALES_TBL')}}
)

select 
    cast(row_number() OVER (ORDER BY Payment ASC) as integer) AS Payment_sk
    ,cast(Payment as varchar(255)) as Source_value
from sk_payment_tbl
order by 2