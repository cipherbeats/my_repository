{{config(materialized='table')}}
with tb1 as (
select id, first_name, last_name
from {{source("datafeed_shared_schema",'stg_customerdata')}}
)
select * from tb1