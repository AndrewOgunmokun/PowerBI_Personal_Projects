Northwind Supply Chain & Sales Analysis (SQL Server + Power BI)
A Power BI dashboard connected to a SQL Server database that analyzes order fulfillment, shipping performance, and sales revenue across the Northwind sample dataset.

What It Does

* Loads the Northwind relational database (Customers, Orders, Order Details, Products, Categories, Employees, Shippers) into Microsoft SQL Server
* Writes SQL queries to explore, join, and aggregate the data — combining up to six related tables to build a single analysis-ready dataset
* Creates a SQL View (`vw_OrderAnalysis`) that joins Orders, Customers, Employees, Shippers, Order Details, Products, and Categories into one queryable object, including a calculated `DaysToShip` field
* Connects Power BI directly to SQL Server (Import mode) instead of a flat file, pulling data live from the view
* Calculates key metrics using DAX measures: total revenue, total orders, average units sold, and average days to ship
* Visualizes the data with KPI cards, an order volume trend line, and comparison charts for shipping performance (by carrier and by country) and sales performance (by category and by top-selling product)

Skills Demonstrated

* SQL: SELECT, WHERE, ORDER BY, multi-table JOINs, GROUP BY aggregations, and CREATE VIEW
* Database setup: installing and configuring SQL Server Express and SSMS, loading a relational sample database
* Power BI: connecting to a live SQL Server data source, DAX measures, Top N filtering, interactive slicers
* Data modeling and dashboard design across both logistics and sales metrics

Dashboard
<img width="1326" height="743" alt="Screenshot 2026-09-26 001632" src="https://github.com/user-attachments/assets/f56d2579-3248-4960-97cc-9c13943e3c39" />
