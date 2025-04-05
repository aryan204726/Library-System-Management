--  Create Summary Tables: Used CTAS to generate new tables based on query results 
--  each book and total book_issued_cnt**

CREATE TABLE book_issued_cnt AS
SELECT books.isbn , books.Book_Title , COUNT(issued_status.issued_id) AS Total_issued_Book
FROM books
JOIN issued_status
ON books.isbn = issued_status.issued_book_ISBN
GROUP BY books.isbn , books.Book_Title;

SELECT * FROM book_issued_cnt;