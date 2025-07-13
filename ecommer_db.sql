CREATE DATABASE ecommerce_db;
USE ecommerce_db;
-- Create customers table
CREATE TABLE customers(
	customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address TEXT
);

-- Create product table
CREATE TABLE products(
	product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);
-- Create orders table
CREATE TABLE orders(
	order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
    
-- Create order_items table
CREATE TABLE order_items(
	order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- Create payments table
CREATE TABLE payments(
	payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount_paid DECIMAL(10,2),
    payment_method VARCHAR(50),
    payment_status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
