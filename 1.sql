-- Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 
-- 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO books VALUES ('978-60129-456-2','To Kill a Mockingbird','classic',6.00,'yes',
							'Harper lee','J.B. Lippincott & Co');
                            SELECT * FROM books WHERE isbn = '978-1-60129-456-2';
						
-- Update an Existing Member's Address

UPDATE member
SET member_address = '125JHAMA'
WHERE member_id = 'C101';


--  Delete a Record from the Issued Status Table 
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

DELETE FROM issued_status
WHERE issued_id = 'IS121' ;

SELECT * 
FROM issued_status 
WHERE issued_id = 'IS121';

-- Retrieve All Books Issued by a Specific Employee 
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT * 
FROM issued_status
WHERE issued_emp_id ='E101';


-- List Members Who Have Issued More Than One Book 
-- Objective: Use GROUP BY to find members who have issued more than one book.

SELECT issued_emp_id , COUNT(*)
FROM issued_status
GROUP BY issued_emp_id
HAVING COUNT(*) >1;


















SET SQL_SAFE_UPDATES = 0;