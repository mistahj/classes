-- Justin Smith
 USE bookstore;

-- Query 1

SELECT category_name,
       product_name,
       list_price
FROM category c
JOIN product p ON p.category_id = c.category_id
ORDER BY category_name,
         product_name;

-- Query 2

SELECT first_name,
       last_name,
       line1,
       city,
       STATE,
       zip_code
FROM customer
JOIN address using(customer_id)
WHERE email_address = "allan.sherwood@yahoo.com";

-- Query 3

SELECT first_name,
       last_name,
       line1,
       city,
       STATE,
       zip_code
FROM customer
JOIN address using(customer_id);

-- Query 4

SELECT c.last_name,
       c.first_name,
       o.order_date,
       p.product_name,
       oi.item_price,
       oi.quantity
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN orderitems oi ON o.order_id = oi.order_id
JOIN product p ON oi.product_id = p.product_id
ORDER BY last_name,
         order_date;

-- Query 5

SELECT DISTINCT a.product_name,
                a.list_price
FROM product a
JOIN product b ON a.product_id != b.product_id
AND a.list_price = b.list_price
ORDER BY a.product_name;

-- Query 6

SELECT DISTINCT oi.product_id,
                p.product_name,
                v.company_name,
                oi.item_price
FROM product p
JOIN orderitems oi ON oi.product_id = p.product_id
JOIN vendor v ON v.vendor_id = p.vendor_id;

-- Query 7

SELECT category_name,
       product_id
FROM category c
LEFT JOIN product p ON p.category_id = c.category_id
WHERE product_id IS NULL;

-- Query 8

SELECT o.order_id,
       o.order_date,
       p.product_name,
       oi.quantity,
       (oi.quantity * oi.item_price) AS amount
FROM orders o
JOIN orderitems oi ON oi.order_id = o.order_id
JOIN product p ON oi.product_id = p.product_id;

-- Query 9

SELECT o.order_id,
       o.order_date,
       p.product_name,
       oi.quantity,
       (oi.quantity * oi.item_price) AS amount
FROM orders o
JOIN orderitems oi ON oi.order_id = o.order_id
JOIN product p ON oi.product_id = p.product_id
WHERE o.ship_date IS NULL
ORDER BY o.order_date;

-- Extra Credit

-- Query 1
SELECT p.product_name, oi.order_id, c.shipping_address_id
FROM product p
JOIN orderitems oi ON oi.product_id = p.product_id
JOIN orders o ON o.order_id = oi.order_id
JOIN customer c ON c.customer_id = o.customer_id
ORDER BY p.product_name;

-- Query 2
SELECT DISTINCT c.last_name, c.first_name
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN orderitems oi ON o.order_id = oi.order_id
WHERE oi.item_price > 50.00;

-- Query 3
SELECT c.last_name,
       c.first_name,
       oi.order_id,
       o.order_date,
       p.product_id,
       p.product_name
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN orderitems oi ON o.order_id = oi.order_id
JOIN product p ON oi.product_id = p.product_id
ORDER BY p.product_id;
