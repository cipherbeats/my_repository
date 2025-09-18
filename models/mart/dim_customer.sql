with customer as (
select * from {{ ref('stg_customer') }}
),

orders as (

select id as order_id,
user_id as customer_id,
order_date
from {{ ref('stg_orders') }}
),

customer_order as (

select customer_id,
min(order_date) as first_order_date,
max(order_date) as most_recent_order_date,
count(order_id) as number_of_orders
from orders
group by customer_id
),

final as (
select c.id as customer_id,
c.first_name,
c.last_name,
co.first_order_date,
co.most_recent_order_date,
coalesce(co.number_of_orders,0) as number_of_orders
from customer c left join customer_order co on c.id=co.customer_id
)

select * from final
