with cte_active_custs as 
(
SELECT
    first_name			AS CUSTOMER_FIRST_NAME
    ,last_name			AS CUSTOMER_LAST_NAME
    ,email				AS CUSTOMER_EMAIL_ADDR
    ,gender				AS CUSTOMER_GENDER
    ,cust_street_addr	AS CUSTOMER_STREET_ADDR
FROM {{ ref ('src_cust_snapshot') }}
WHERE dbt_valid_to IS NULL
)

select * from cte_active_custs;