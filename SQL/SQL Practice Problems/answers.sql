/*
BOOK NAME: SQL Practice Problems: 57 beginning, intermediate, and advanced challenges for you to solve using a “learn-by-doing” approach
DATABASE USED: MS SQL SERVER - Northwind database backup file
*/

/* Introductory Problems */

/* 1. Which shippers do we have?
We have a table called Shippers. Return all the fields from all the shippers */

SELECT * FROM [dbo].[Shippers];

/*2. Certain fields from Categories
In the Categories table, selecting all the fields using this SQL:
Select * from Categories
…will return 4 columns. We only want to see two columns, CategoryName and Description.*/

SELECT [CategoryName], [Description]
FROM [dbo].[Categories];

/*3. Sales Representatives
We’d like to see just the FirstName, LastName, and HireDate of all the employees with the Title of Sales
Representative. 
Write a SQL statement that returns only those employees.*/

SELECT [FirstName], [LastName], [HireDate]
FROM [dbo].[Employees]
WHERE [Title] = 'Sales Representative';

/* 4. Sales Representatives in the United States
Now we’d like to see the same columns as above, but only for those employees that both have the title of
Sales Representative, and also are in the United States. */

SELECT [FirstName], [LastName], [HireDate]
FROM [dbo].[Employees]
WHERE [Title] = 'Sales Representative'
	AND [Country] = 'USA';

/* 5. Orders placed by specific EmployeeID. Show all the orders placed by a specific employee.
The EmployeeID for this Employee (Steven Buchanan) is 5. */

SELECT [OrderID], [OrderDate]
FROM [dbo].[Orders]
WHERE [EmployeeID] = 5;

/* 6. Suppliers and ContactTitles.
In the Suppliers table, show the SupplierID, ContactName, and ContactTitle for those Suppliers
whose ContactTitle is not Marketing Manager. */

SELECT [SupplierID], [ContactName], [ContactTitle]
FROM [dbo].[Suppliers]
WHERE [ContactTitle] <> 'Marketing Manager';

/* 7. Products with “queso” in ProductName. In the products table, we’d like to see the ProductID
and ProductName for those products where the ProductName includes the string “queso”. */

SELECT [ProductID], [ProductName]
FROM [dbo].[Products]
WHERE [ProductName] LIKE '%queso%';

/* 8. Orders shipping to France or Belgium. 
Looking at the Orders table, there’s a field called ShipCountry. 
Write a query that shows the OrderID, CustomerID, and ShipCountry for the orders where
the ShipCountry is either France or Belgium. */

SELECT [OrderID], [CustomerID], [ShipCountry]
FROM [dbo].[Orders]
WHERE [ShipCountry] = 'France' OR [ShipCountry] = 'Belgium'; 

/* 9. Orders shipping to any country in Latin America 
(Brazil
Mexico
Argentina
Venezuela) */

SELECT [OrderID], [CustomerID], [ShipCountry]
FROM [dbo].[Orders]
WHERE [ShipCountry] IN ('Brazil', 'Mexico', 'Argentina', 'Venezuela'); 

/* 10. Employees, in order of age
For all the employees in the Employees table, show the FirstName, LastName, Title, and BirthDate.
Order the results by BirthDate, so we have the oldest employees first. */

SELECT [FirstName], [LastName], [Title], [BirthDate]
FROM [dbo].[Employees]
ORDER BY 4;

/* 11. Showing only the Date with a DateTime field
In the output of the query above, showing the Employees in order of BirthDate, we see the time of
the BirthDate field, which we don’t want. Show only the date portion of the BirthDate field. */

SELECT [FirstName], [LastName], [Title], CAST([BirthDate] AS DATE)
FROM [dbo].[Employees]
WHERE [Title] = 'Sales Representative'
ORDER BY [BirthDate];

/* 12. Employees full name
Show the FirstName and LastName columns from the Employees table, 
and then create a new column called FullName, showing FirstName and LastName
joined together in one column, with a space in between.
 */

 SELECT [FirstName], [LastName], CONCAT([FirstName],' ' ,[LastName]) AS FullName
 FROM [dbo].[Employees];

 /* 13. OrderDetails amount per line item 
 In the OrderDetails table, we have the fields UnitPrice and Quantity. 
 Create a new field, TotalPrice, that multiplies these two together. We’ll
ignore the Discount field for now. In addition, show the OrderID, ProductID, UnitPrice,
and Quantity. Order by OrderID and ProductID */

SELECT [OrderID], [ProductID], [UnitPrice], [Quantity], ([UnitPrice] * [Quantity]) AS TotalPrice
FROM [dbo].[Order Details]
ORDER BY 1, 2;

/* 14. How many customers?
How many customers do we have in the Customers table? 
Show one value only, and don’t rely on getting the recordcount at the end of a resultset */

SELECT COUNT(DISTINCT [CustomerID]) AS TOTAL_CUSTOMERS
FROM [dbo].[Customers];

/* 15. When was the first order?
Show the date of the first order ever made in the Orders table */
SELECT MIN([OrderDate]) AS FIRST_ORDER
FROM [dbo].[Orders];