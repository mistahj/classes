-- Justin Smith

USE bookstore;

-- Query 1
SELECT COUNT(*) AS "Orders", SUM(tax_amount) AS "Total tax"
FROM orders;

-- Query 2
SELECT  product_id, COUNT(product_id) AS NumOrders
FROM orderitems
GROUP BY product_id
ORDER BY NumOrders DESC;

-- Query 3
SELECT category_name, COUNT(product_id), MAX(list_price)
FROM category
JOIN product
  ON category.category_id = product.category_id
GROUP BY category_name
ORDER BY COUNT(product_id) DESC;

-- Query 4
SELECT email_address, SUM(item_price * quantity) AS item_prices, SUM(discount_amount * quantity) AS total_discount
FROM customer c
JOIN orders o
  ON o.customer_id = c.customer_id
JOIN orderitems oi
  ON oi.order_id = o.order_id
GROUP BY email_address
ORDER BY item_prices DESC;

-- Query 5
SELECT email_address, COUNT(oi.order_id) as order_number, SUM((item_price - discount_amount) * quantity) AS total_amount
FROM customer c
JOIN orders o
  ON o.customer_id = c.customer_id
JOIN orderitems oi
  ON oi.order_id = o.order_id
  GROUP BY email_address
HAVING order_number > 1
ORDER BY total_amount DESC;

-- Query 6
SELECT email_address, COUNT(oi.order_id) as order_number, SUM((item_price - discount_amount) * quantity) AS total_amount
FROM customer c
JOIN orders o
  ON o.customer_id = c.customer_id
JOIN orderitems oi
  ON oi.order_id = o.order_id
  WHERE item_price > 400
  GROUP BY email_address
ORDER BY total_amount DESC;

-- Query 7
SELECT email_address, COUNT(oi.order_id ) AS product_count
FROM customer c
JOIN orders o
  ON o.customer_id = c.customer_id
JOIN orderitems oi
  ON oi.order_id = o.order_id
GROUP BY email_address
HAVING product_count > 1;

-- Query 8
SELECT category_name, COUNT(product_id) AS product_count, AVG(list_price) AS avg_price, MIN(list_price) AS lowest_price, MAX(list_price) AS highest_price
FROM product p
JOIN category c
  ON c.category_id = p.category_id
WHERE category_name = "book"
GROUP BY category_name;

-- Query 9
SELECT v.vendor_id, COUNT(product_id) AS product_count
FROM product p
JOIN vendor v
  ON v.vendor_id = p.vendor_id
WHERE list_price > 100
GROUP BY vendor_id;

-- Query 10
SELECT vendor_id, p.category_id, COUNT(product_id) AS number_of_products, AVG(list_price) AS average_price
FROM product p
JOIN category c
  ON c.category_id = p.category_id
GROUP BY vendor_id, p.category_id
HAVING number_of_products > 1;
