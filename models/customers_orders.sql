{{ config(materialized="table", schema="L3_CURATED") }}

with
    customerorder as (
        select
            c.customerid,
            concat(c.firstname, ' ', c.lastname) as customername,
            count(o.orderid) as ordercount
        from {{ source("LANDING", "CUSTOMERS") }} c
        join {{ source("LANDING", "ORDERS") }} o on c.customerid = o.customerid
        group by c.customerid, customername
    )

select customerid, customername, ordercount
from customerorder
order by ordercount desc
