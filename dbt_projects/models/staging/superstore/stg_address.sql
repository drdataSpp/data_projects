with cte_address as 
(
    select 
        CAST(City AS VARCHAR(500))          as CITY_NAME,
        CAST("State" AS VARCHAR(500))       as STATE_NAME,
        CAST(Country AS VARCHAR(500))       as COUNTRY_NAME,
        CAST(Region AS VARCHAR(500))        as REGION_NAME,
        CAST(Postal_Code AS INTEGER)        as POSTAL_CODE
    from {{ source('RAW_SuperStore_tbl', 'RAW_SuperStore')}}
    --adding group by clause to filter dups
    group by City, "State", Country, Region, Postal_Code
)

select * from cte_address;