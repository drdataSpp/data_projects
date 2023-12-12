with cte_hist_custs as 
(
SELECT
    first_name			AS CUSTOMER_FIRST_NAME
    ,last_name			AS CUSTOMER_LAST_NAME
    ,email				AS CUSTOMER_EMAIL_ADDR
    ,gender				AS CUSTOMER_GENDER
    ,cust_street_addr	AS CUSTOMER_STREET_ADDR
    ,CASE 
        WHEN dbt_valid_to IS NULL
        THEN 'ACTIVE' 
        ELSE 'INACTIVE'
    END AS RECORD_STATUS_FLAG
FROM {{ ref ('src_cust_snapshot') }}
)

select * from cte_hist_custs;