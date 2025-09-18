with tb1 as (
select id, first_name, last_name
from {{source("datafeed_shared_schema",'customer')}}
)
select * from tb1