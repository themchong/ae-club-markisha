SELECT orders.customer_id
, customers.name
, customers.email 
, MIN(orders.created_at) AS first_order_at
, COUNT(distinct orders.id) AS number_of_orders
FROM analytics-engineers-club.coffee_shop.customers
LEFT JOIN
analytics-engineers-club.coffee_shop.orders ON customers.id = orders.customer_id
GROUP BY orders.customer_id, customers.name, customers.email
ORDER BY first_order_at LIMIT 5