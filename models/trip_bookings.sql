{{ config(materialized='view', schema='L2_LANDING') }}

select *
from {{ source('training', 'TRIP_BOOKINGS') }}