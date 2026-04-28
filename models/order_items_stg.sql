{{ config(materialized="view", schema="L2_STAGING") }}

select
    orderitemid,
    orderid,
    productid,
    quantity,
    unitprice,
    quantity * unitprice as totalprice,
    updated_at
from {{ source("LANDING", "ORDERITEMS") }}
