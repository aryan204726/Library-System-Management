/*
Task 19: Stored Procedure Objective: Create a stored procedure to manage the status of books in a library system. Description: 
Write a stored procedure that updates the status of a book in the library based on its issuance. 
The procedure should function as follows: The stored procedure should take the book_id as an input parameter. 
The procedure should first check if the book is available (status = 'yes'). 
If the book is available, it should be issued, and the status in the books table should be updated to 'no'. 
If the book is not available (status = 'no'), the procedure should return an error message indicating that 
the book is currently not available.
*/


DELIMITER //

CREATE PROCEDURE issued_book(
    IN p_issue_id VARCHAR(10),
    IN p_member_id VARCHAR(10),
    IN p_issued_book_ISBN VARCHAR(50),
    IN p_issued_emp_id VARCHAR(10)
)
BEGIN
    DECLARE book_status VARCHAR(10);

    -- Get current status of the book
    SELECT status INTO book_status
    FROM books
    WHERE isbn = p_issued_book_ISBN;

    -- Check status and perform actions
    IF book_status = 'Yes' THEN

        -- Insert into issued_status table
        INSERT INTO issued_status (
            issued_id,
            issued_member_id,
            issued_date,
            issued_book_ISBN,
            issued_emp_id
        )
        VALUES (
            p_issue_id,
            p_member_id,
            CURDATE(),
            p_issued_book_ISBN,
            p_issued_emp_id
        );

        -- Update book status to 'No'
        UPDATE books
        SET status = 'No'
        WHERE isbn = p_issued_book_ISBN;

        -- Success message
        SELECT CONCAT('✅ Book is issued successfully! ISBN = ', p_issued_book_ISBN) AS Message;

    ELSE
        -- Book unavailable message
        SELECT CONCAT('❌ Book is currently unavailable! ISBN = ', p_issued_book_ISBN) AS Message;
    END IF;
END //

DELIMITER ;



SELECT * FROM books;
-- 978-0-06-112241-5 -- yes
-- 978-0-375-41398-8 -- no
SELECT * FROM issued_status;



CAll issued_book('IS155' , 'C108' , '978-0-06-112241-5'  , 'E104');
CAll issued_book('IS156' , 'C108' , '978-0-375-41398-8'  , 'E104');

SELECT * FROM books
WHERE isbn = '978-0-375-41398-8';








	
