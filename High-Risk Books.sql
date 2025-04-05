/* 
Task 18: Identify Members Issuing High-Risk Books
Write a query to identify members who have issued books more than twice with the status "damaged" in the books table. 
Display the member name, book title, and the number of times they've issued damaged books.
*/



SELECT member.member_name,
	   books.Book_Title,
       count(return_status.issued_id) AS Damaged_books
FROM issued_status
JOIN return_status ON issued_status.issued_id = return_status.issued_id
JOIN member ON issued_status.issued_member_id = member.member_id
JOIN books ON issued_status.issued_book_ISBN = books.isbn
WHERE return_status.book_quality = 'damaged'
GROUP BY member.member_name, books.Book_Title
HAVING  count(return_status.issued_id) >= 2;





