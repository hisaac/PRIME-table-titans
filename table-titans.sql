-- Tasks
-- Get all customers and their addresses.
-- Get all orders and their line items.
-- Which warehouses have cheetos?
-- Which warehouses have diet pepsi?
-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
-- How many customers do we have?
-- How many products do we carry?
-- What is the total available on-hand quantity of diet pepsi?

--1.
SELECT *
FROM customers
JOIN addresses
ON addresses.customer_id=customers.id;

--2.
SELECT *
FROM orders
LEFT JOIN line_items
ON orders.id=line_items.order_id;

--3.
SELECT warehouse
FROM warehouse
JOIN warehouse_product ON warehouse.id=warehouse_product.warehouse_id
JOIN products ON products.id=warehouse_product.product_id
WHERE products.description='cheetos' AND warehouse_product.on_hand > 0;
--Delta


--4.
SELECT warehouse
FROM warehouse
JOIN warehouse_product ON warehouse.id=warehouse_product.warehouse_id
JOIN products ON products.id=warehouse_product.product_id
WHERE products.description='diet pepsi' AND warehouse_product.on_hand > 0;
--Alpha, Delta, and Gamma

--5.
SELECT first_name, COUNT(*)
--select customers.first_name, orders.id, addresses.street
FROM customers
JOIN addresses ON addresses.customer_id=customers.id
JOIN orders ON orders.address_id=addresses.id
GROUP BY first_name;
