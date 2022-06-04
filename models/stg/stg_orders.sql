select 
-- from orders
o.orderdate,
o.shipdate,
o.shipmode,
o.ORDERSELLINGPRICE - o.ORDERCOSTPRICE as orderprofit,
o.ORDERCOSTPRICE,
o.ORDERSELLINGPRICE,
-- from customers
c.customerid,
c.customername,
c.segment,
c.country,
-- from product
p.productid,
p.category,
p.productname,
p.subcategory
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_products') }} as p
on o.productid = p.productid


