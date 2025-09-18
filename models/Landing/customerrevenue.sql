{{config(materialized='table')}}
with customerrevenue as (

select c.customerid,
concat(c.firstname,' ',c.lastname) as customer_name,
count(o.orderid) as ordercount,
sum(oi.quantity*oi.unitprice) as revenue
from {{source("sleekmart",'customers')}} c
join {{source("sleekmart",'orders')}} o on c.customerid=o.customerid
join {{source("sleekmart",'orderitems')}} oi on oi.orderid=o.orderid
group by c.customerid,concat(c.firstname,' ',c.lastname)
order by ordercount
)
select customerid, customer_name, ordercount from customerrevenue

