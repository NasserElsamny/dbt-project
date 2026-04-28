{{ config(materialized="table", schema="L3_CURATED") }}

select
    c.customerid, c.customername, sum(o.revenue) revenue, sum(o.ordercount) ordercount
from {{ ref("customers_stg") }} c
join {{ ref("orders_fact") }} o
group by c.customerid, c.customername
