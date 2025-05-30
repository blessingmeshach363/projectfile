CREATE DATABASE sales_db;

USE sales_db;

CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales (customer_name, product_name, quantity, price, sale_date) VALUES
('Alice', 'Laptop', 1, 1000.00, '2025-05-01'),
('Bob', 'Smartphone', 2, 500.00, '2025-05-02'),
('Alice', 'Headphones', 3, 50.00, '2025-05-03'),
('Charlie', 'Laptop', 1, 1000.00, '2025-05-04'),
('Bob', 'Smartphone', 1, 500.00, '2025-05-05');

select * from sales;

## analyze the data

## 1) Total sales

SELECT SUM(quantity * price) AS total_sales
FROM sales;

## 2) Top-selling Products

SELECT product_name, SUM(quantity) AS total_quantity_sold
FROM sales
GROUP BY product_name
ORDER BY total_quantity_sold DESC;

## 3) Sales by month

SELECT 
    MONTH(sale_date) AS month,
    SUM(quantity * price) AS monthly_sales
FROM sales
GROUP BY MONTH(sale_date)
ORDER BY month;

## 4) Best Customers

SELECT 
    customer_name,
    SUM(quantity * price) AS total_spent
FROM sales
GROUP BY customer_name
ORDER BY total_spent DESC;








