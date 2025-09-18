{{config(materialized='table')}}
with tab1 as (

select id,
order_id,
payment_method,
amount
from {{source("datafeed_shared_schema",'stg_payment')}}
)

select * from tab1