{% snapshot src_cust_snapshot %}

{{
    config(
      target_database='MaxMinManufacturingDS7502',
      target_schema='dbo',
      unique_key='cust_id',

      strategy='check',
      check_cols=['first_name','last_name','email','gender','cust_street_addr'],
    )
}}

select * from {{ source('RAW', 'cust') }}

{% endsnapshot %}