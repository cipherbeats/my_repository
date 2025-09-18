{{config(materialized='incremental',
incremental_strategy = 'append'
)}}

select * from {{source("datafeed_shared_schema",'stg_order')}}
where id in (1,2,3)