-- 
/*    
Task 14: Update Book Status on Return
Write a query to update the status of books in the books table to "Yes" when they are returned 
(based on entries in the return_status table).
*/

SELECT * from issued_status
WHERE issued_book_ISBN = '978-0-451-52994-2';



SELECT * FROM books
WHERE isbn = '978-0-307-58837-1';

UPDATE books
SET Status = 'NO'
WHERE isbn = '978-0-451-52994-2';

SELECT * FROM return_status
WHERE issued_id = 'IS130';

INSERT INTO return_status(return_id, issued_id, return_date, book_quality)
VALUES
('RS125', 'IS130', CURRENT_DATE, 'Good');

SELECT * FROM return_status
WHERE issued_id = 'IS130';

UPDATE books
SET Status = 'Yes'
WHERE isbn = '978-0-451-52994-2';


UPDATE books 
SET status = 'Yes'
WHERE isbn IN (
    SELECT issued_status.issued_book_ISBN
    FROM issued_status
    JOIN return_status 
    ON issued_status.issued_id = return_status.issued_id
);

SELECT * FROM books;



-- Store Procedures

DELIMITER //

CREATE PROCEDURE add_return_records( IN p_return_id VARCHAR(10), 
									 IN p_issued_id VARCHAR(10),
                                     IN p_book_quality VARCHAR(10)
                                     )
BEGIN
		INSERT INTO return_status
        (return_id, issued_id, return_date, book_quality)
        VALUES
        (p_return_id,p_issued_id ,CURRENT_DATE ,p_book_quality);
        
        UPDATE books
        SET Status ='Yes'
        WHERE isbn = (SELECT issued_Book_isbn FROM issued_status
					  WHERE issued_id = p_issued_id);
                      
			SELECT CONCAT('Thankyou for returning the book:',
                (SELECT issued_Book_isbn FROM issued_status
					  WHERE issued_id = p_issued_id)) AS Message;
    
END //

DELIMITER ;

CALL add_return_records('RS135' ,'IS135' , 'Good');
CALL add_return_records('RS148', 'IS140', 'Good');

SELECT * FROM return_status;
SELECT * FROM issued_status;

SELECT * FROM return_status
WHERE issued_id = 'IS135';

SELECT * FROM issued_status
WHERE issued_id = 'IS140';

SELECT * FROM books
WHERE isbn = '978-0-330-25864-8';








