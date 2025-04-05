/*
Task 15: Branch Performance Report
Create a query that generates a performance report for each branch, showing the number of books issued, 
the number of books returned, and the total revenue generated from book rentals.
*/

SELECT * FROM branch;
SELECT * FROM issued_status;
SELECT * FROM return_status;
SELECT * FROM books;

CREATE TABLE branch_report 
	AS	
SELECT branch.Branch_id ,
	   branch.manager_id,
       COUNT(issued_status.issued_id) AS number_of_books_issued,
       COUNT(return_status.return_id) AS number_of_books_returned,
       SUM(books.rental_price) AS total_revenue
       FROM  issued_status
       JOIN employee  ON issued_status.issued_emp_id = employee.emp_id
       JOIN branch    ON branch.Branch_id = employee.Branch_id
	   LEFT JOIN return_status  ON return_status.issued_id = issued_status.issued_id
       JOIN books   ON books.isbn = issued_status.issued_book_ISBN
       GROUP BY branch.Branch_id , branch.manager_id;
       
       SELECT * FROM branch_report;
       
       
       
