{{ config(materialized="table", schema="L3_CURATED", 
    pre_hook = [ log_start_time(this) ],
    post_hook = [ log_end_time(this) ])
}}

select
    c.customerid, c.customername, sum(o.revenue) revenue, sum(o.ordercount) ordercount
from {{ ref("customers_stg") }} c
join {{ ref("orders_fact") }} o
group by c.customerid, c.customername
