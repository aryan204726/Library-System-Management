-- Retrieve All Books in a Specific Category

SELECT * 
FROM books
WHERE category = 'Classic';

-- Find Total Rental Income by Category:

SELECT category , SUM(rental_price) AS Total_Income
FROM books
JOIN issued_status
ON books.isbn = issued_status.issued_book_ISBN
GROUP BY category;

-- List Members Who Registered in the Last 180 Days:

SELECT * 
FROM member
WHERE reg_date >= CURRENT_DATE - INTERVAL 180 DAY;

-- List Employees with Their Branch Manager's Name and their branch details:

SELECT 
employee.emp_id,
employee.emp_name,
employee.Positions,
employee.Salary,
branch.*,
employee.emp_name  AS Manager_Name
FROM employee
JOIN branch
ON employee.Branch_id = branch.Branch_id
JOIN employee AS Manager
ON branch.manager_id = employee.emp_id;


-- Create a Table of Books with Rental Price Above a Certain Threshold:

CREATE TABLE Expensive_book (
SELECT * 
FROM books
WHERE rental_price > 7.00);

SELECT * FROM Expensive_book;

-- Retrieve the List of Books Not Yet Returned

SELECT * 
FROM issued_status
 LEFT JOIN return_status
ON issued_status.issued_id = return_status.issued_id
WHERE return_status.return_id IS  NULL;


































