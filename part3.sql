/*Part 3: Regional Performance Insights
• From the List of Orders dataset, identify the top 5 states with the highest order
count. For each of these states, calculate the total sales and average proﬁt.
• Highlight any regional disparities in sales or proﬁtability. Suggest regions or cities
that should be prioritized for improvement.*/

--Getting top 5 state with most orders with sum abd avg profit
SELECT state,
        count(DISTINCT l.orderid) as orders,
        sum(o.amount) as total_sales,
        round(avg(profit)::numeric,2)  as average_profit
FROM list_of_orders as l
JOIN order_details as o on o.orderid=l.orderid
    GROUP BY state
    ORDER BY orders DESC
    LIMIT 5;

         
