/* Justin Smith */

USE bookdb;


/* Query 1: */
SHOW TABLES; 

/* Query 2: */
DESC book; 

/* Query 3: */
SELECT * FROM book; 

/* Query 4: */
INSERT INTO BOOK VALUES('9247381001','HOW TO MANAGE THE MANAGER','09-05-03',1,31.95); 
INSERT INTO BOOK VALUES('2147428890','SHORTEST POEMS','01-05-05',5,39.95); 

/* Query 5: */
SELECT ISBN, Title, Price FROM book; 

/* Query 6: */
DELETE FROM book WHERE publisher_id > 10;
SELECT * FROM book;