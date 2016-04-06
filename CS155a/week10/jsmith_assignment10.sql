-- Justin Smith

USE bookstore;

-- Query 1

SELECT list_price, FORMAT(list_price, 1), CONVERT(list_price , UNSIGNED), CAST(list_price AS UNSIGNED)
FROM product;

-- Query 2

SELECT date_added, CAST(date_added AS DATE), CAST(date_added AS CHAR(7)), CAST(date_added AS TIME)
FROM product;

-- Query 3

SELECT list_price, discount_percent, ROUND(list_price * (discount_percent * .01), 2) AS discount_amount
FROM product;

-- Query 4

SELECT order_date, DATE_FORMAT(order_date, '%Y'), DATE_FORMAT(order_date, '%M-%d-%Y'), DATE_FORMAT(order_date, '%r'), DATE_FORMAT(order_date, '%m/%d/%y %h:%i')
FROM orders;

-- Query 5

SELECT card_number, LENGTH(card_number), RIGHT(card_number, 4), CONCAT(REPLACE(LEFT(card_number, 12),LEFT(card_number, 12), "XXXX-XXXX-XXXX-"), RIGHT(card_number, 4))
FROM orders;

-- Query 6

SELECT order_id, order_date,  DATE_ADD(order_date, INTERVAL 2 DAY) AS approx_ship_date, ship_date, DATEDIFF(ship_date, order_date)
FROM orders
WHERE MONTH(order_date) = 05
