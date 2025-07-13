USE ecommerce_db;

-- 1. Trigger: Auto-Decrease Stock When an Order Is Placed
DELIMITER $$

CREATE TRIGGER reduce_stock_after_order
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
  UPDATE products
  SET stock_quantity = stock_quantity - NEW.quantity
  WHERE product_id = NEW.product_id;
END$$

DELIMITER ;

-- 2. NOT NULL + DEFAULTS (if not already present)
ALTER TABLE payments
MODIFY COLUMN payment_status VARCHAR(20) NOT NULL DEFAULT 'Pending';

--  3. Add Indexes to Improve Performance
CREATE INDEX idx_customer_id ON orders(customer_id);
CREATE INDEX idx_order_id ON payments(order_id);
CREATE INDEX idx_product_id ON order_items(product_id);

-- 4. Foreign Key Constraints Review
SHOW CREATE TABLE order_items;

-- 5. Clean Unused/Test Records
DELETE FROM customers WHERE name = 'Test User';
-- 6. Test It
-- Check product stock before
SELECT product_id, name, stock_quantity FROM products WHERE product_id = 1;

-- Insert a new order item
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price)
VALUES (85, 40, 1, 2, 599.00);

-- Check product stock after
SELECT product_id, name, stock_quantity FROM products WHERE product_id = 1;

