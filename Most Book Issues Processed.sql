-- Task 17: Find Employees with the Most Book Issues Processed
-- Write a query to find the top 3 employees who have processed the most book issues.
-- Display the employee name, number of books processed, and their branch.


SELECT employee.emp_name AS Employee_name,
        branch.*,
        COUNT(issued_status.issued_id) AS no_of_book_issued
        FROM employee
        JOIN issued_status ON employee.emp_id = issued_status.issued_emp_id
        JOIN branch ON branch.Branch_id = employee.Branch_id
        GROUP BY 1 ,2  
        ORDER BY no_of_book_issued DESC LIMIT 3; 
        
        
