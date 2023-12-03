{{ config(materialized='view') }}

with cte_analysis_accepted_prods as (

    select fct.ProductCode as product_id,
            prod.ProductName as product_name,
            sum(fct.AcceptedProducts) as tot_accepted_products
    from [dbo].[ManufacturingFact] fct
    left join {{ ref ('stg_products') }} as prod
        on prod.product_id = fct.ProductCode
    group by fct.ProductCode, prod.ProductName
)

select *
from cte_analysis_accepted_prods
;