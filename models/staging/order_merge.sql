{{config(materialized='incremental', incremental_strategy='merge', unique_key = 'id')}}

select * from {{source("datafeed_shared_schema",'stg_order')}} where id in (5,6,7)