{{config(materialized='table')}}
with tb1 as (
select id, order_date,user_id
from {{source('datafeed_shared_schema','stg_order')}}
)
select * from tb1