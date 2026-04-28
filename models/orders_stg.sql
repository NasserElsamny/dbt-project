{{ config(materialized="view", schema="L2_STAGING") }}

select
    orderid,
    orderdate,
    customerid,
    employeeid,
    storeid,
    status as statuscd,
    case
        when status = '01'
        then 'In Progress'
        when status = '02'
        then 'Completed'
        when status = '03'
        then 'Cancelled'
        else null
    end as statusdesc,
    case when storeid = 1000 then 'Online' else 'In-store' end as order_channel,
    updated_at,
    current_timestamp as dbt_updated_at
from {{ source("LANDING", "ORDERS") }}
