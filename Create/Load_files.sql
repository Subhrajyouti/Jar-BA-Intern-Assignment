CREATE TABLE List_of_Orders (
    OrderID VARCHAR(10) PRIMARY KEY,
    OrderDate DATE,
    CustomerName VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(50)
);


copy List_of_Orders(OrderID, OrderDate, CustomerName, State, City)
FROM 'E:\Jar BA Intern Assignment\List_of_Orders_55FFC79CF8.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

CREATE TABLE Order_Details (
    OrderID VARCHAR(10) ,
    Amount float,
    Profit float,
    Quantity float,
    Category VARCHAR(50),
    SubCategory VARCHAR(50)
);
copy Order_Details(OrderID,Amount,Profit,Quantity,Category,SubCategory)
FROM 'E:\Jar BA Intern Assignment\Order_Details_19795F61CF.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');
CREATE TABLE Sales_target (
    Month VARCHAR(50),
    Category VARCHAR(50),
    Target float
);
copy Sales_Target(Month,Category,Target)
FROM 'E:\Jar BA Intern Assignment\Sales_target_DD2E9B96A0.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

ALTER TABLE sales_target
rename month to months

