{{config(materialized='table')}}
with tab1 as (

select *
from {{source("datafeed_shared_schema",'stg_item_data')}}
)
select * from tab1