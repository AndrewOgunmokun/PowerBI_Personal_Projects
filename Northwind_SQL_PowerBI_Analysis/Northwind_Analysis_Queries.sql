/* ============================================================
   Northwind Supply Chain & Sales Analysis
   SQL Server queries used to build the Power BI dashboard
   ============================================================ */


/* ------------------------------------------------------------
   1. MAIN ANALYSIS VIEW
   Joins Orders, Customers, Employees, Shippers, Order Details,
   Products, and Categories into a single analysis-ready dataset.
   This view is the direct data source for the Power BI report.
   ------------------------------------------------------------ */

CREATE VIEW vw_OrderAnalysis AS
SELECT
    Orders.OrderID,
    Orders.OrderDate,
    Orders.ShippedDate,
    DATEDIFF(day, Orders.OrderDate, Orders.ShippedDate) AS DaysToShip,
    Customers.CompanyName AS CustomerName,
    Customers.Country AS CustomerCountry,
    Employees.FirstName + ' ' + Employees.LastName AS EmployeeName,
    Shippers.CompanyName AS ShipperName,
    Products.ProductName,
    Categories.CategoryName,
    [Order Details].Quantity,
    [Order Details].UnitPrice,
    [Order Details].Quantity * [Order Details].UnitPrice AS LineTotal
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON [Order Details].ProductID = Products.ProductID
JOIN Categories ON Products.CategoryID = Categories.CategoryID;
GO


/* ------------------------------------------------------------
   2. REVENUE BY PRODUCT
   Uses SUM() and GROUP BY to calculate total revenue generated
   by each product, sorted highest to lowest.
   ------------------------------------------------------------ */

SELECT
    Products.ProductName,
    SUM([Order Details].Quantity * [Order Details].UnitPrice) AS TotalRevenue
FROM [Order Details]
JOIN Products ON [Order Details].ProductID = Products.ProductID
GROUP BY Products.ProductName
ORDER BY TotalRevenue DESC;


/* ------------------------------------------------------------
   3. ORDER COUNT BY CUSTOMER
   Uses COUNT() and GROUP BY to identify which customers place
   the most orders.
   ------------------------------------------------------------ */

SELECT
    Customers.CompanyName,
    COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CompanyName
ORDER BY NumberOfOrders DESC;


/* ------------------------------------------------------------
   4. AVERAGE ORDER LINE VALUE BY COUNTRY
   Uses AVG() across a three-table join to compare average
   order value across customer countries.
   ------------------------------------------------------------ */

SELECT
    Customers.Country,
    AVG([Order Details].Quantity * [Order Details].UnitPrice) AS AvgLineValue
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
GROUP BY Customers.Country
ORDER BY AvgLineValue DESC;


/* ------------------------------------------------------------
   5. SAMPLE QUERY AGAINST THE VIEW
   Confirms the view returns fully joined, analysis-ready rows.
   This is the same query Power BI runs when it imports the view.
   ------------------------------------------------------------ */

SELECT * FROM vw_OrderAnalysis;
