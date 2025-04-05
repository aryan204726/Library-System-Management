-- Identify Members with Overdue Books
-- Write a query to identify members who have overdue books (assume a 30-day return period).
-- Display the member's_id, member's name, book title, issue date, and days overdue.

SELECT  issued_status.issued_member_id,
		member.member_name,
        books.Book_Title,
        issued_status.issued_date,
        CURRENT_DATE -issued_status.issued_date AS Over_dues_days
FROM issued_status
JOIN member
ON issued_status.issued_member_id = member.member_id
JOIN books
ON issued_status.issued_book_ISBN = books.isbn
LEFT JOIN return_status
ON issued_status.issued_id = return_status.issued_id
WHERE return_status.return_date IS NULL
	AND
    (CURRENT_DATE - issued_status.issued_date) > 30
    ORDER BY issued_date ASC;
