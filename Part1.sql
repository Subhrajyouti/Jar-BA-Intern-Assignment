--Merge the List of Orders and Order Details datasets on the basis of Order ID.

SELECT *
FROM order_details
JOIN list_of_orders ON list_of_orders.orderid= order_details.orderid;

--Calculate the total sales (Amount) for each category across all orders.
SELECT category,sum(Amount)
FROM order_details
GROUP BY category;