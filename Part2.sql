/*Part 2: Target Achievement Analysis
• Using the Sales Target dataset, calculate the percentage change in target sales
for the Furniture category month-over-month.
• Analyse the trends to identify months with signiﬁcant target ﬂuctuations.
Suggest strategies for aligning target expectations with actual performance
trends.*/

with a as 
(    SELECT 
           months,
            to_char(months, 'Mon YYYY') AS month_year,
            TARGET, 
            lag(TARGET,1,0) OVER ( ORDER BY months) as past_target
FROM 
            sales_target
WHERE 
            category ='Furniture' 
        )    
        
SELECT month_year,
       round((target-past_target)::numeric/target::numeric,4)*100  as percent_target_change
FROM  a           
join order_details as o on o.   
WHERE  past_target >0  ;

SELECT   to_char(l.OrderDate, 'Mon YYYY') AS month_year,
         sum(amount)
         FROM order_details as o
         join list_of_orders as l on l.orderid=o.orderid
           WHERE category = 'Furniture'
         GROUP by month_year;

WITH target_cte AS (
    SELECT 
        months,
        to_char(months, 'Mon YYYY') AS month_year,
        target,
        LAG(target, 1) OVER (ORDER BY months) AS past_target,
        CASE 
            WHEN LAG(target, 1) OVER (ORDER BY months) > 0 
            THEN ROUND(((target - LAG(target, 1) OVER (ORDER BY months))::numeric 
                   / LAG(target, 1) OVER (ORDER BY months))::numeric, 4) * 100
            ELSE NULL 
        END AS percent_target_change
    FROM sales_target
    WHERE category = 'Furniture'
),
sales_cte AS (
    SELECT 
        to_char(l.OrderDate, 'Mon YYYY') AS month_year,
        SUM(o.amount) AS total_sale
    FROM order_details o
    JOIN list_of_orders l ON l.orderid = o.orderid
    WHERE category = 'Furniture'
    GROUP BY to_char(l.OrderDate, 'Mon YYYY')
)
SELECT 
    t.month_year,
    s.total_sale,
    t.target,
    s.total_sale - t.target,
    t.percent_target_change
FROM target_cte t
LEFT JOIN sales_cte s ON t.month_year = s.month_year
ORDER BY t.months;

       





 
