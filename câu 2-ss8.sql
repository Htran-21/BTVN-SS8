create database nhan_su;
use nhan_su;
create table employees(
	employee_id INT primary key,
	full_name VARCHAR(200),
	department VARCHAR(200),
	salary DECIMAL,
	hire_date DATE
);
insert into Employees (employee_id, full_name, department, salary, hire_date) values
('1', 'Nguyễn Văn A', 'IT', 60, '2022-01-15'),
('2', 'Trần Thị B', 'Sales', 50, '2021-05-20'),
('3', 'Lê Văn C', 'HR', 85, '2023-11-01'),
('4', 'Phạm Thị D', 'IT', 100, '2020-03-10'),
('5', 'Hoàng Văn E', 'Marketing', 40, '2022-09-25');
select * from employees;
-- Sử dụng COUNT:
SELECT COUNT(employee_id) AS number_of_employees
FROM Employees;
-- Sử dụng SUM:
SELECT SUM(salary) AS total_monthly_salary
FROM Employees;
-- Sử dụng AVG:
SELECT AVG(salary) AS average_salary
FROM Employees;
-- Sử dụng MIN và MAX (với số):
SELECT MAX(salary) AS highest_salary
FROM Employees;
SELECT MIN(salary) AS lowest_salary
FROM Employees;
-- Sử dụng MIN và MAX (với ngày tháng):
SELECT MIN(hire_date) AS earliest_hire_date
FROM Employees;
-- Kết hợp với WHERE:
SELECT SUM(salary) AS it_department_salary
FROM Employees
WHERE department = 'IT';
