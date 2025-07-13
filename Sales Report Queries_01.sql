USE ecommerce_db;
-- 1. Total Revenue Till Date
SELECT SUM(amount_paid) AS total_revenue
FROM payments
WHERE payment_status = 'Completed';

-- 2. Monthly Revenue Report
SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS month,
    SUM(amount_paid) AS monthly_revenue
FROM payments
WHERE payment_status = 'Completed'
GROUP BY month
ORDER BY month;

-- 3. Top 5 Customers by Total Spend
SELECT c.name, SUM(p.amount_paid) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
WHERE p.payment_status = 'Completed'
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 5;

--  4. Top 5 Selling Products (by Quantity)
SELECT pr.name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products pr ON oi.product_id = pr.product_id
GROUP BY pr.name
ORDER BY total_sold DESC
LIMIT 5;

-- 5. Category-wise Revenue 
SELECT p.category, SUM(oi.quantity * oi.price) AS category_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;
