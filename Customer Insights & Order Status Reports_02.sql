USE ecommerce_db;
-- 1. Customers Who Placed More Than 2 Orders
SELECT c.customer_id, c.name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING total_orders > 2
ORDER BY total_orders DESC;

-- 2. Customers Who Have NOT Placed Any Orders
SELECT c.customer_id, c.name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 3. Orders With Pending Payment
SELECT o.order_id, c.name, o.total_amount, p.payment_status
FROM orders o
JOIN payments p ON o.order_id = p.order_id
JOIN customers c ON o.customer_id = c.customer_id
WHERE p.payment_status = 'Pending';

-- 4. Average Order Value Per Customer
SELECT c.customer_id, c.name, 
       COUNT(o.order_id) AS total_orders,
       ROUND(AVG(o.total_amount), 2) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- 5. Recent Orders (Last 7 Days)
SELECT o.order_id, c.name, o.order_date, o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_date >= CURDATE() - INTERVAL 7 DAY
ORDER BY o.order_date DESC;
