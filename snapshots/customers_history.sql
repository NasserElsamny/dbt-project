{% snapshot customers_history %}

{{
    config(
      target_schema='SCD_HISTORICAL',
      unique_key='CUSTOMERID',
      strategy='timestamp',
      updated_at='updated_at',
    )
}}


SELECT * FROM {{ source('LANDING', 'CUSTOMERS') }}

{% endsnapshot %}