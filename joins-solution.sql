-- 1. Get all customers and their addresses
SELECT * from customers JOIN addresses ON customers.id = addresses.customer_id;
-- 2. Get all orders and their line items
SELECT * FROM orders LEFT OUTER JOIN line_items ON orders.id = line_items.order_id;
-- 3. Which warehouses have cheetos?
SELECT warehouse.warehouse FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE products.description = 'cheetos';
--OR
SELECT warehouse FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON products.id = warehouse_product.product_id
WHERE products.description = 'cheetos';
-- 4. Which warehouses have diet pepsi?
SELECT warehouse FROM warehouse JOIN warehouse_product
ON warehouse.id = warehouse_product.warehouse_id JOIN products
ON products.id = warehouse_product.product_id WHERE products.description = 'diet pepsi';
-- 5. Get the number of orders for each customer
SELECT c.*, count(o.id) FROM customers AS c
JOIN addresses AS a ON c.id = a.customer_id
JOIN orders AS o ON a.id = o.address_id
GROUP BY c.id;
-- 6. How many customers do we have?
SELECT count(id) FROM customers;
-- 7. How many products do we carry?
SELECT count(id) FROM products;
-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT sum(wp.on_hand) FROM products AS p
JOIN warehouse_product AS wp ON p.id = wp.product_id
WHERE p.description = 'diet pepsi';
--OR
SELECT sum(warehouse_product.on_hand) FROM warehouse_product
JOIN products ON products.id = warehouse_product.product_id
WHERE products.description = 'diet pepsi';
