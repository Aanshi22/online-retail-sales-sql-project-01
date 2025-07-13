USE ecommerce_db;
--  1. Top 5 Customers with Rank Based on Total Spend (Using RANK())
SELECT 
    c.customer_id,
    c.name,
    SUM(p.amount_paid) AS total_spent,
    RANK() OVER (ORDER BY SUM(p.amount_paid) DESC) AS spending_rank
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
WHERE p.payment_status = 'Completed'
GROUP BY c.customer_id, c.name
ORDER BY spending_rank;

-- 2. Running Total of Revenue by Date
SELECT 
    payment_date,
    amount_paid,
    SUM(amount_paid) OVER (ORDER BY payment_date) AS running_total
FROM payments
WHERE payment_status = 'Completed';

-- 3. Most Recent Order Per Customer (Using ROW_NUMBER())
SELECT *
FROM (
    SELECT 
        c.name,
        o.order_id,
        o.order_date,
        ROW_NUMBER() OVER (PARTITION BY c.customer_id ORDER BY o.order_date DESC) AS rn
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
) AS sub
WHERE rn = 1;

-- 4. Create a View: Customer Spend Summary
CREATE VIEW customer_spending_summary AS
SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders,
    SUM(p.amount_paid) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
WHERE p.payment_status = 'Completed'
GROUP BY c.customer_id, c.name;

SELECT * FROM customer_spending_summary;

-- Create a View: Top 5 Products by Quantity Sold
CREATE VIEW top_products AS
SELECT 
    p.name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.name
ORDER BY total_quantity_sold DESC
LIMIT 5;

SELECT * FROM top_products;
