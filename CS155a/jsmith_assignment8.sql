-- Justin Smith

USE bookstore;

-- Query 1
SELECT COUNT(*) AS "Orders", SUM(tax_amount) AS "Total tax"
FROM orders;

-- Query 2
SELECT 
