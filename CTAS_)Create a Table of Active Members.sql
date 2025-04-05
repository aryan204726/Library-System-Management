-- Task 16: CTAS: Create a Table of Active Members
-- Use the CREATE TABLE AS (CTAS) statement to create a new table active_members 
-- containing members who have issued at least one book in the last 2 months.



CREATE TABLE active_member
	AS
SELECT * 
FROM member
WHERE member_id IN (
SELECT DISTINCT 
issued_status.issued_member_id
FROM issued_status
WHERE issued_date >= CURRENT_DATE-INTERVAL 2 MONTH) ;

SELECT * FROM active_member;
