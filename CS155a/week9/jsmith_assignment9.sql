-- Justin Smith

 USE bookstore;

-- Query 1

SELECT DISTINCT category_name
FROM category
WHERE category_id IN
        (SELECT category_id
         FROM product)
ORDER BY category_name;

-- Query 2

SELECT product_name,
       list_price
FROM product
WHERE list_price >
        (SELECT AVG(list_price)
         FROM product)
ORDER BY list_price DESC;

-- Query 3

SELECT category_name
FROM category
WHERE NOT EXISTS
        (SELECT *
         FROM product
         WHERE category.category_id = product.category_id);

-- Query 4

SELECT email_address,
       o.order_id,
       SUM((item_price - discount_amount) * quantity) AS total_price
FROM customer c
JOIN orders o ON o.customer_id = c.customer_id
JOIN orderitems oi ON oi.order_id = o.order_id
GROUP BY email_address,
         oi.order_id;


SELECT email_address,
       MAX(total_price) AS max_order_total
FROM
    (SELECT email_address,
            o.order_id,
            SUM((item_price - discount_amount) * quantity) AS total_price
     FROM customer c
     JOIN orders o ON o.customer_id = c.customer_id
     JOIN orderitems oi ON oi.order_id = o.order_id
     GROUP BY email_address,
              oi.order_id) t
GROUP BY email_address;

-- Query 5

SELECT p.product_name,
       p.discount_percent
FROM product p
WHERE p.discount_percent NOT IN
        (SELECT e.discount_percent
         FROM product e
         WHERE e.product_name != p.product_name)
ORDER BY product_name;

-- Query 6

SELECT email_address,
       order_id,
       order_date
FROM customer c
NATURAL JOIN orders o
WHERE order_id =
        (SELECT MIN(order_id)
         FROM orders o
         WHERE c.customer_id = o.customer_id);

-- Query 7

SELECT product_id,
       product_name,
       list_price
FROM product
WHERE product_id IN
        (SELECT product_id
         FROM orderitems
         GROUP BY product_id
         HAVING COUNT(order_id) > 1);

-- Query 8

SELECT first_name,
       last_name
FROM customer
WHERE customer_id IN
        ( SELECT customer_id
         FROM orders
         WHERE order_id IN
                 ( SELECT order_id
                  FROM orderitems
                  WHERE item_price > 300 ));

-- Query 9

SELECT last_name,
       first_name,
       email_address
FROM customer
WHERE customer_id IN
        ( SELECT customer_id
         FROM orders
         WHERE order_id IN (1,
                            2,
                            3));

-- Query 10

SELECT last_name,
       first_name,
       email_address
FROM customer c
WHERE customer_id IN
        ( SELECT customer_id
         FROM orders
         WHERE order_id IN
                 ( SELECT order_id
                  FROM orderitems
                  WHERE product_id IN
                          ( SELECT product_id
                           FROM product
                           WHERE vendor_id IN
                                   ( SELECT vendor_id
                                    FROM vendor
                                    WHERE company_name LIKE "H%"))));

-- Query 11

SELECT product_id, product_name, list_price
FROM product
WHERE product_id IN (SELECT product_id
                     FROM orderitems
                     GROUP BY product_id
                     HAVING COUNT(order_id) >=2);
