-- Justin Smith

USE bookstore;

-- Query 1

SELECT last_name, first_name, customer_id
FROM customer
WHERE customer_id != 77779;

-- Query 2

SELECT product_name, description
FROM product
WHERE category_id > 21;

-- Query 3

SELECT last_name, first_name, customer_id, email_address
FROM customer
WHERE customer_id = 11119;

-- Query 4

SELECT item_id, item_price, discount_amount, quantity, item_price * quantity AS price_total,
discount_amount * quantity AS discount_total, (item_price - discount_amount) * quantity AS item_total
FROM orderitems
HAVING item_total > 900
ORDER BY item_total DESC;

-- Query 5

SELECT store_id AS "store ID", region_id AS "region ID", region_name AS "region name"
from STORE;

-- Query 6

SELECT customer_id AS "customer ID", email_address AS "email address"
FROM customer;

-- Query 7

SELECT DISTINCT customer_id AS "customer ID"
FROM orders;

-- Query 8

SELECT product_name, list_price, discount_percent, list_price * (discount_percent * .01) AS discount_amount,
list_price - list_price * (discount_percent * .01) AS discount_price
FROM product
ORDER BY discount_price DESC
LIMIT 5;

-- Query 9

SELECT customer_id, line1, line2, CONCAT(city, ', ', state) AS "city/state", zip_code
FROM address;

-- Query 10

SELECT CONCAT (last_name, ', ', first_name) AS full_name
FROM customer;
