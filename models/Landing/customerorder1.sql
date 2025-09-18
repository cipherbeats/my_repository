{{config(materialized='table')}}
with customerorder as (

select c.customerid,
concat(c.firstname,' ',c.lastname) as customer_name,
count(o.orderid) as ordercount
from {{source("sleekmart",'customers')}} c
join {{source("sleekmart",'orders')}} o on c.customerid=o.customerid
group by c.customerid,concat(c.firstname,' ',c.lastname)
order by ordercount
)
select customerid, customer_name, ordercount from customerorder

