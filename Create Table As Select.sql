/*Task 20: Create Table As Select (CTAS) Objective: Create a CTAS (Create Table As Select) query to identify overdue books and calculate fines.
Description:
 Write a CTAS query to create a new table that lists each member and the books they have issued but not returned within 30 days. 
The table should include: The number of overdue books. 
The total fines, with each day's fine calculated at $0.50. 
The number of books issued by each member. 
The resulting table should show: Member ID Number of overdue books Total fines
*/

CREATE TABLE Over_due_book
	AS
SELECT 	
	issued_status.issued_member_id AS Member_id,
    issued_status.issued_id,
    DATEDIFF(CURDATE(),issued_status.issued_date) AS days_passed
    FROM issued_status
    LEFT JOIN return_status
    ON issued_status.issued_id = return_status.issued_id
    WHERE return_status.return_id IS NOT NULL
    AND DATEDIFF(CURDATE(), issued_status.issued_date) > 30;
    
    
    CREATE TABLE member_fine
		AS
    SELECT 
    Member_id,
    COUNT(*) AS overdue_book,
    SUM((days_passed - 30) *0.50) AS total_fine
    FROM over_due_book
    GROUP BY Member_id;
    
    
    
    CREATE TABLE total_issued_books
			AS
    SELECT  
			issued_member_id AS member_id,
            COUNT(*) AS Total_issued
	FROM issued_status
    GROUP BY member_id;
    
    
    
    
    SELECT 
			member_fine.Member_id,
            member_fine.overdue_book,
            member_fine.total_fine,
            total_issued_books.Total_issued
            FROM member_fine
            JOIN total_issued_books
            ON member_fine.member_id = total_issued_books.member_id;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


