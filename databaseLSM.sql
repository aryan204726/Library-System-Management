CREATE DATABASE Library_System_Management;
USE Library_System_Management;

DROP TABLE IF EXISTS  books;
CREATE TABLE books (
isbn VARCHAR(20),
Book_Title VARCHAR(100),
category VARCHAR(50),
rental_price FLOAT,
Status VARCHAR(10),
author VARCHAR(50),
Publisher VARCHAR(75),
PRIMARY KEY(isbn)
);

DROP TABLE  IF EXISTS Branch;
CREATE TABLE Branch(
Branch_id VARCHAR(10),
manager_id VARCHAR(10) ,
Branch_address VARCHAR(15),
Contact_no VARCHAR(20),
PRIMARY KEY(Branch_id)
);



DROP TABLE IF EXISTS employee;
CREATE TABLE employee(
emp_id VARCHAR(10),
emp_name VARCHAR(25),
Positions VARCHAR(15),
Salary FLOAT,
Branch_id VARCHAR(10),
PRIMARY KEY(emp_id),
FOREIGN KEY(Branch_id) REFERENCES Branch(Branch_id)
);


DROP TABLE IF EXISTS member;
CREATE TABLE member(
member_id VARCHAR(10) ,
member_name VARCHAR(20),
member_address VARCHAR(20),
reg_date DATE,
PRIMARY KEY(member_id)
);

DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status(
issued_id VARCHAR(10),
issued_member_id VARCHAR(25),
issued_book_name VARCHAR(75),
issued_date DATE,
issued_book_ISBN VARCHAR(25),
issued_emp_id VARCHAR(10),
PRIMARY KEY(issued_id),
FOREIGN KEY(issued_member_id) REFERENCES member(member_id),
FOREIGN KEY(issued_book_ISBN) REFERENCES books(isbn),
FOREIGN KEY(issued_emp_id) REFERENCES employee(emp_id)
);



DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status(
return_id VARCHAR(10),
issued_id VARCHAR(10) ,
return_book_name VARCHAR(75),
return_date DATE,
return_book_ISBN VARCHAR(25),
PRIMARY KEY(return_id),
FOREIGN KEY(issued_id) REFERENCES issued_status(issued_id)
);























































