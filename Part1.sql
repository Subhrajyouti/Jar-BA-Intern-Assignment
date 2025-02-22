--Merge the List of Orders and Order Details datasets on the basis of Order ID.
SELECT *
FROM order_details
JOIN list_of_orders ON list_of_orders.orderid= order_details.orderid;

--Calculate the total sales (Amount) for each category across all orders.
SELECT category,sum(Amount)
FROM order_details
GROUP BY category;

--For each category, calculate the average profit per order and total profit margin
--(profit as a percentage of Amount).

SELECT category,sum(amount), round(avg(profit)::numeric,2) as avg_of_profit,
       round(sum(profit::numeric/Amount::numeric)::numeric,2) as total_profit_mergin 
FROM order_details
GROUP BY category;        



