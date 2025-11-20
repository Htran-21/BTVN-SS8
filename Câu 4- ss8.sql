create database kinh_doanh;
use kinh_doanh;
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(200),
    price DECIMAL
);
INSERT INTO Products (product_id, product_name, category, price) VALUES
(101, 'Laptop XYZ', 'Electronics', 12),
(102, 'Bách Khoa Lập Trình', 'Books', 45),
(103, 'Áo Thun Cotton', 'Clothing', 25),
(104, 'Điện Thoại ABC', 'Electronics', 850),
(105, 'Giày Thể Thao Pro', 'Clothing', 99);
select* from products;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL
);
INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 10, '2025-10-01', 70),
(2, 20, '2025-10-01', 40),
(3, 10, '2025-10-02', 27),
(4, 30, '2025-10-03', 75),
(5, 20, '2025-10-03', 100);
select * from orders;
-- Sử dụng GROUP BY (Cơ bản):
SELECT category AS category,
    COUNT(product_id) AS number_of_products
FROM Products
GROUP BY category;
-- Sử dụng GROUP BY với SUM:
SELECT customer_id AS customer_id,
    SUM(total_amount) AS total_spent
FROM Orders
GROUP BY customer_id;
-- Kết hợp nhiều hàm tổng hợp với GROUP BY:
SELECT category AS category,
    COUNT(product_id) AS product_count,
    AVG(price) AS avg_price,
    MAX(price) AS max_price,
    MIN(price) AS min_price
FROM Products
GROUP BY category;
-- Sử dụng HAVING để lọc nhóm:
SELECT customer_id AS customer_id,
    SUM(total_amount) AS total_spent
FROM Orders
GROUP BY customer_id
HAVING SUM(total_amount) > 1000;
-- Sử dụng HAVING với COUNT:
SELECT category AS category,
    COUNT(product_id) AS product_count
FROM Products
GROUP BY category
HAVING COUNT(product_id) > 5;
-- Kết hợp GROUP BY, ORDER BY và LIMIT:
SELECT customer_id AS customer_id,
    SUM(total_amount) AS total_spent
FROM Orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 3;