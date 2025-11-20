create database thu_vien;
use thu_vien;
create table Books (
	book_id INT primary key,
	title VARCHAR(200),
	author VARCHAR(200),
	publication_year INT,
    pages INT
);
create table BorrowingRecords (
record_id INT primary key,
book_id INT,
foreign key (book_id) references books(book_id),
borrow_date DATE
);
INSERT INTO Books (book_id, title, author, publication_year, pages) VALUES
(1, 'Dune', 'Frank Herbert', 1965, 412),
(2, 'The Hobbit', 'J.R.R. Tolkien', 1937, 310),
(3, '1984', 'George Orwell', 1949, 328),
(4, 'The Da Vinci Code', 'Dan Brown', 2003, 454),
(5, 'Educated', 'Tara Westover', 2018, 352);
select * from books;
INSERT INTO BorrowingRecords (record_id, book_id, borrow_date) VALUES
(101, 1, '2023-10-01'),
(102, 3, '2023-10-05'),
(103, 2, '2023-11-10'),
(104, 5, '2024-01-15'),
(105, 4, '2024-01-20');
select * from BorrowingRecords;
-- Sử dụng COUNT:
SELECT COUNT(book_id) AS total_books
FROM Books;
-- Sử dụng SUM:
SELECT SUM(pages) AS total_pages_in_library
FROM Books;
-- Sử dụng AVG:
SELECT AVG(pages) AS average_pages_per_book
FROM Books;
-- Sử dụng MIN và MAX (với số):
SELECT MIN(publication_year) AS oldest_book_year
FROM Books;
SELECT MAX(publication_year) AS newest_book_year
FROM Books;
-- Sử dụng MIN (với ngày tháng):
SELECT MIN(borrow_date) AS first_borrow_date
FROM BorrowingRecords;
-- Kết hợp với WHERE:
SELECT COUNT(book_id) AS books_after_2000
FROM Books
WHERE publication_year > 2000;