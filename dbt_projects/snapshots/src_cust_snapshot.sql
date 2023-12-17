{% snapshot src_cust_snapshot %}

{{
    config(
      target_database='MaxMinManufacturingDS7502',
      target_schema='dbo',
      unique_key='cust_id',

      strategy='check',
      check_cols=['email','cust_street_addr'],
      invalidate_hard_deletes=True,
    )
}}

select * from {{ source('RAW', 'cust') }}

{% endsnapshot %}