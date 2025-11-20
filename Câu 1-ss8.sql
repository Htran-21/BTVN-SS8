create database CUA_HANG;
use cua_hang;
create table Products(
product_id INT primary key,
product_name VARCHAR(200),
price DECIMAL,
stock_quantity INT 
);
insert into Products (product_id, product_name, price, stock_quantity) values
(1, 'Laptop Gaming', 1500.00, 10),
(2, 'Chuột không dây', 25.50, 50),
(3, 'Bàn phím cơ', 89.99, 30),
(4, 'Màn hình 27 inch', 299.99, 15),
(5, 'Ổ cứng SSD 1TB', 120.00, 20);
select * from products;
create table Customers (
customer_id INT primary key,
customer_name VARCHAR(250),
city VARCHAR(200)
);
insert into Customers (customer_id, customer_name, city) values
(101, 'Nguyễn Văn A', 'Hanoi'),
(102, 'Trần Thị B', 'Ho Chi Minh'),
(103, 'Lê Văn C', 'Hanoi'),
(104, 'Phạm Thị D', 'Da Nang'),
(105, 'Hoàng Văn E', 'Hanoi');
select * from customers;
create table Orders (
order_id INT primary key,
customer_id INT,
foreign key (customer_id) references Customers(customer_id),
order_date date,
total_amount DECIMAL
);
insert into Orders (order_id, customer_id, order_date, total_amount) values
(1001, 101, '2025-10-20', 1600.00),
(1002, 103, '2025-10-21', 115.49),
(1003, 102, '2025-10-21', 350.00),
(1004, 105, '2025-10-22', 25.50),
(1005, 101, '2025-10-23', 420.00);
select * from orders;
-- Sử dụng COUNT
select COUNT(product_id) as total_products from Products;
-- Sử dụng SUM
select SUM(total_amount) AS total_revenue
from Orders;
-- Sử dụng AVG
select  avg(price) as average_price
from Products;
-- Sử dụng MIN và MAX
select MAX(total_amount) as max_order_amount
from Orders;
select MIN(total_amount) as min_order_amount
from Orders;
-- Kết hợp với WHERE
select COUNT(customer_id) as hanoi_customers_count
from Customers
where city = 'Hanoi';
