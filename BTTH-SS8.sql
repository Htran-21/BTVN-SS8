create database thongke;
use thongke;
create table Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    product VARCHAR(100),
    quantity INT,
    price DECIMAL(10, 2),
    country VARCHAR(50)
);
INSERT INTO Orders (order_id, customer_name, product, quantity, price, country) VALUES
(1, 'John Doe', 'Laptop', 2, 800, 'USA'),
(2, 'Robert Luna', 'Smartphone', 1, 600, 'USA'),
(3, 'David Robin', 'Tablet', 3, 300, 'UK'),
(4, 'John Reinh', 'Laptop', 1, 800, 'UK'),
(5, 'Betty Doe', 'Headphones', 4, 50, 'UAE');
select * from orders;
-- COUNT: Có bao nhiêu đơn hàng trong bảng Orders?
SELECT COUNT(order_id) AS total_orders FROM Orders;
-- SUM: Tổng số lượng sản phẩm đã bán là bao nhiêu?
SELECT SUM(quantity) AS total_quantity_sold FROM Orders;
-- AVG: Giá trung bình của các sản phẩm là bao nhiêu?
SELECT AVG(price) AS average_price FROM Orders;
-- MIN: Tìm giá thấp nhất của sản phẩm.
SELECT MIN(price) AS lowest_price FROM Orders;
-- MAX: Tìm giá cao nhất của sản phẩm.
SELECT MAX(price) AS highest_price FROM Orders;
-- COUNT + GROUP BY: Đếm số đơn hàng theo từng quốc gia (country).
SELECT country, COUNT(order_id) AS orders_per_country FROM Orders
GROUP BY country;
-- AVG + GROUP BY: Tính giá trung bình của sản phẩm theo từng quốc gia.
SELECT country, AVG(price) AS average_price_per_country FROM Orders
GROUP BY country;
