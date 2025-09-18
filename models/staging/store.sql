{{config(materialized='table')}}
with tb1 as (

select * from {{source("datafeed_shared_schema",'stg_store_data')}}

)

select * from tb1