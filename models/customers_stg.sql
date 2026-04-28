{{ config(materialized="view", schema="L2_STAGING") }}

select
    customerid,
    firstname,
    lastname,
    email,
    phone,
    address,
    city,
    state,
    zipcode,
    updated_at,
    concat(firstname, ' ', lastname) as customername
from {{ source("LANDING", "CUSTOMERS") }}
