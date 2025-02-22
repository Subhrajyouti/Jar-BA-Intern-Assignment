COPY List_of_Orders(Order_ID, Customer_Name, Order_Date, Order_Status)
FROM 'E:\Jar BA Intern Assignment\List_of_Orders_55FFC79CF8.csv'
DELIMITER ',' CSV HEADER;

COPY Order_Details(Detail_ID, Order_ID, Product_Name, Quantity, Price)
FROM 'E:\Jar BA Intern Assignment\Order_Details_19795F61CF.csv'
DELIMITER ',' CSV HEADER;

COPY Sales_Target(Target_ID, Category, Month, Target_Sales)
FROM 'E:\Jar BA Intern Assignment\Sales_target_DD2E9B96A0.csv'
DELIMITER ',' CSV HEADER;
