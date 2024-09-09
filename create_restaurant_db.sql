SELECT COUNT(*) FROM menu_items
;

-- What are the least and most expensive items on the menu?

SELECT MIN(price) AS Least_priced_item, MAX(price) AS Expensive_item 
FROM menu_items;

-- How many Italian dishes are on the menu? 
-- What are the least and most expensive Italian dishes on the menu?

SELECT COUNT(*) AS Italian_dishes, MIN(price) as Least_dish, 
MAX(price) AS Expensive_dish
FROM menu_items
WHERE category = 'Italian'
;


-- How many dishes are in each category? 
-- What is the average dish price within each category?


SELECT category,COUNT(*) AS Number_of_Dishes,
ROUND(AVG(price),2) AS Average_dish_price
FROM menu_items
GROUP BY category;
---------------------------------------------------------------------------

SELECT * FROM order_details
LIMIT 10;

-- View the order_details table. What is the date range of the table?
SELECT order_date FROM order_details;
SELECT MIN(order_date), MAX(order_date) FROM order_details;

-- How many orders were made within this date range? 
-- How many items were ordered within this date range?

SELECT COUNT(DISTINCT order_id) AS Orders,
COUNT(*) AS Total_number_items
FROM order_details;

-- Which orders had the most number of items?
SELECT order_id, COUNT(order_details_id) AS number_of_items
FROM order_details
GROUP BY order_id
ORDER BY number_of_items DESC;


-- How many orders had more than 12 items?
SELECT COUNT(*) FROM(SELECT order_id, COUNT(item_id)
FROM order_details
GROUP BY order_id
HAVING COUNT(item_id) > 12) AS Number_of_orders;

----------------------------------------------------------------------------------