CREATE TABLE List_of_Orders (
    OrderID VARCHAR(10) PRIMARY KEY,
    OrderDate DATE,
    CustomerName VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(50)
);

-- Option 1: Using the server-side COPY command
SET datestyle = 'DMY';  -- if your dates are in DD-MM-YYYY format
COPY List_of_Orders(OrderID, OrderDate, CustomerName, State, City)
FROM 'E:\Jar BA Intern Assignment\List_of_Orders_55FFC79CF8.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
    
);
-- Option 2: Using psql's \copy command (runs on the client)
copy List_of_Orders(OrderID, OrderDate, CustomerName, State, City)
FROM 'E:\Jar BA Intern Assignment\List_of_Orders_55FFC79CF8.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');
