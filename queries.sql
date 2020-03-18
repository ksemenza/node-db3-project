-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.productName, c.CategoryName
FROM product as p
JOIN category as c ON p.categoryId = c.id;


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.id AS OrderID, s.CompanyName AS ShipperCompanyName, o.OrderDate 
FROM [Order] as o
JOIN Shipper AS s 
ON o.shipVia = s.id
WHERE o.OrderDate < '2012-08-09' 
ORDER BY o.OrderDate;

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.id AS ProductID, o.id as OrderID, p.productName, p.QuantityPerUnit 
FROM product as p
LEFT JOIN OrderDetail as o
ON p.id = o.ProductID
WHERE instr(o.id, '10251') > 0 
ORDER BY p.productName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.Id AS OrderID, c.CompanyName AS CustomerCompanyName, e.LastName AS EmployeeLastName
FROM [Order] AS o 
JOIN Customer AS c ON o.CustomerId = c.id
JOIN Employee AS e ON o.EmployeeId = e.id;

-- Stretch
--Displays CategoryName and a new column called Count that shows how many products are in each category. 
-- Shows 8 records.
SELECT C.CategoryName, COUNT(p.ProductID) as Count
FROM [Products] AS P
JOIN Categories AS C 
ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryName;

-- Stretch
-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. 
-- Shows 196 records.
SELECT o.OrderID, SUM(o.Quantity) AS ItemCount 
FROM [OrderDetails] AS o
GROUP BY o.OrderID;
