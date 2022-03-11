USE AdventureWorks2019
GO

SELECT *
FROM Production.Product AS p

--1. How many products can you find in the Production.Product table?
SELECT count(p.ProductID)
FROM Production.Product AS p

SELECT count(DISTINCT p.Name)
FROM Production.Product AS p
--These two methods give same result, which means there is no product share same name.
--I believe the first method is more reasonable.

--2. Write a query that retrieves the number of products in the Production.Product table that are included in a subcategory. The rows that have NULL in column ProductSubcategoryID are considered to not be a part of any subcategory.
SELECT count(p.ProductID)
FROM Production.Product AS p
WHERE p.ProductSubcategoryID IS NOT NULL


--3. How many Products reside in each SubCategory? Write a query to display the results with the following titles.
-- 	 ProductSubcategoryID	CountedProducts
	 --------------------	---------------
SELECT p.ProductSubcategoryID, count(ProductID) AS CountedProducts
FROM Production.Product AS p
WHERE p.ProductSubcategoryID IS NOT NULL
GROUP BY p.ProductSubcategoryID

--4. How many products that do not have a product subcategory.
SELECT count(p.ProductID)
FROM Production.Product AS p
WHERE p.ProductSubcategoryID IS NULL

--5. Write a query to list the sum of products quantity in the Production.ProductInventory table.
SELECT sum(p.Quantity)
FROM Production.ProductInventory AS p

--6. Write a query to list the sum of products in the Production.ProductInventory table and LocationID set to 40 and limit the result to include just summarized quantities less than 100.
--   ProductID			TheSum
     -----------		---------
SELECT ProductID, SUM(quantity) AS TheSum
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY ProductID
HAVING SUM(quantity) < 100

-- 7.Write a query to list the sum of products with the shelf information in the Production.ProductInventory table and LocationID set to 40 and limit the result to include just summarized quantities less than 100
--   Shelf			ProductID			TheSum
     ----------		-----------			-----------
SELECT Shelf, ProductID, SUM(quantity) AS TheSum
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY ProductID, shelf
HAVING SUM(quantity) < 100

--8. Write the query to list the average quantity for products where column LocationID has the value of 10 from the table Production.ProductInventory table.
     ----------		-----------			-----------
SELECT avg(p.Quantity)
FROM Production.ProductInventory AS p
WHERE p.LocationID = 10

--9. Write query  to see the average quantity  of  products by shelf  from the table Production.ProductInventory
--   ProductID		Shelf			TheAvg
     -----------	----------		-----------
SELECT p.Shelf, avg(p.Quantity) AS TheAvg
FROM Production.ProductInventory AS p
GROUP BY p.Shelf

--10. Write query  to see the average quantity  of  products by shelf excluding rows that has the value of N/A in the column Shelf from the table Production.ProductInventory
--    ProductID			Shelf			TheAvg
	  -----------		----------		-----------
SELECT p.Shelf, avg(p.Quantity) AS TheAvg
FROM Production.ProductInventory AS p
WHERE p.Shelf != 'N/A'
GROUP BY p.Shelf

--11. List the members (rows) and average list price in the Production.Product table. This should be grouped independently over the Color and the Class column. Exclude the rows where Color or Class are null.
--    Color                        Class            TheCount          AvgPrice
      ---------------			   -----			-----------       ---------------------
SELECT Color,Class,COUNT(*) AS TheCount, AVG(ListPrice) AS AvgPrice
FROM Production.Product
WHERE Class IS NOT NULL AND Color IS NOT NULL
GROUP BY Color, Class

--12. Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables. Join them and produce a result set similar to the following.
--    Country                        Province
      ---------                      ----------------------
SELECT *
FROM person.CountryRegion

SELECT *
FROM person.StateProvince

SELECT c.CountryRegionCode, p.StateProvinceCode
FROM person.CountryRegion as c JOIN person.StateProvince as p on c.CountryRegionCode=p.CountryRegionCode
ORDER BY c.CountryRegionCode

--13. Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables and list the countries filter them by Germany and Canada. Join them and produce a result set similar to the following.
--   Country                        Province
     ---------                      ----------------------
SELECT c.CountryRegionCode, p.StateProvinceCode
FROM person.CountryRegion as c JOIN person.StateProvince as p on c.CountryRegionCode=p.CountryRegionCode
WHERE c.CountryRegionCode in ('CA','DE')
ORDER BY c.CountryRegionCode


-- Using Northwnd Database: (Use aliases for all the Joins)
Use Northwind
GO
--14. List all Products that has been sold at least once in last 25 years.

--the two method gives the same result, but fitst method use views
SELECT DISTINCT od.ProductName
FROM Orders AS o JOIN [Order Details Extended] AS od on o.OrderID = od.OrderID
WHERE o.OrderDate <= '1997-03-10 00:00:00.000'
ORDER BY od.ProductName

SELECT DISTINCT p.ProductName
FROM Orders AS o JOIN [Order Details] AS od on o.OrderID = od.OrderID JOIN Products AS p on od.ProductID = p.ProductID
WHERE o.OrderDate <= '1997-03-10 00:00:00.000'
ORDER BY p.ProductName

--15. List top 5 locations (Zip Code) where the products sold most.
SELECT TOP 5 o.ShipPostalCode, count(o.OrderID) as [number of orders]
FROM Orders AS o JOIN [Order Details] AS od on o.OrderID = od.OrderID JOIN Products AS p on od.ProductID = p.ProductID
WHERE o.ShipPostalCode is not NULL
GROUP BY o.ShipPostalCode
ORDER BY count(o.OrderID) DESC
--not sure if we should or shouldn't exclude null ShipPostalCode

--16. List top 5 locations (Zip Code) where the products sold most in last 25 years.
SELECT TOP 5 o.ShipPostalCode, count(o.OrderID) as [number of orders]
FROM Orders AS o JOIN [Order Details] AS od on o.OrderID = od.OrderID JOIN Products AS p on od.ProductID = p.ProductID
WHERE o.ShipPostalCode is not NULL and o.OrderDate <= '1997-03-10 00:00:00.000'
GROUP BY o.ShipPostalCode
ORDER BY count(o.OrderID) DESC

--17. List all city names and number of customers in that city.
SELECT c.city, count(c.CustomerID) as [number of customers]
FROM Customers AS c
GROUP BY c.city
ORDER BY [number of customers] DESC

--18. List city names which have more than 2 customers, and number of customers in that city
SELECT c2.city, c2.[number of customers]
FROM (
SELECT c.city, count(c.CustomerID) as [number of customers]
FROM Customers AS c
GROUP BY c.city
) AS c2
WHERE c2.[number of customers] > 2


--19. List the names of customers who placed orders after 1/1/98 with order date.
SELECT c.CustomerID, c.ContactName, o.OrderDate
FROM Customers AS c JOIN Orders AS o on c.CustomerID = o.CustomerID
WHERE o.OrderDate > '1998-01-01 00:00:00.000'
ORDER BY c.CustomerID

--20. List the names of all customers with most recent order dates
SELECT c.CustomerID, c.ContactName, o.OrderDate
FROM Customers AS c JOIN Orders AS o on c.CustomerID = o.CustomerID
WHERE o.OrderDate = (
SELECT max(o.OrderDate)
FROM Orders AS o
)

--21. Display the names of all customers along with the count of products they bought
SELECT c.ContactName, count(o.OrderID) as [count of products he/she bought]
FROM Customers AS c JOIN Orders AS o on c.CustomerID = o.CustomerID
GROUP BY c.ContactName
ORDER BY [count of products he/she bought] DESC

--22. Display the customer ids who bought more than 100 Products with count of products.
SELECT c2.CustomerID, c2.[count of products he/she bought]
FROM (
SELECT c.CustomerID, count(o.OrderID) as [count of products he/she bought]
FROM Customers AS c JOIN Orders AS o on c.CustomerID = o.CustomerID
GROUP BY c.CustomerID) as c2
WHERE c2.[count of products he/she bought]>100
--It gives no result. Maybe there is a typo of 100? Maybe should be 10?

--23. List all of the possible ways that suppliers can ship their products. Display the results as below
--    Supplier Company Name							Shipping Company Name
      ---------------------------------             ----------------------------------
SELECT DISTINCT s.CompanyName AS [Supplier Company Name], sh.CompanyName as [Shipping Company Name]
FROM Orders as o 
join [Order Details] as od on o.OrderID=od.OrderID
join Products as p on od.ProductID=p.ProductID
join Suppliers as s on p.SupplierID=s.SupplierID
join Shippers as sh on o.ShipVia=sh.ShipperID
ORDER BY [Supplier Company Name]
--24. Display the products order each day. Show Order date and Product Name.
SELECT o.OrderDate, p.ProductName
FROM Orders AS o JOIN [Order Details] AS od on o.OrderID = od.OrderID JOIN Products AS p on od.ProductID = p.ProductID
ORDER BY o.OrderDate

--25. Displays pairs of employees who have the same job title.
SELECT e1.name, e2.name, e1.title
FROM(
SELECT e.FirstName + ' ' + e.LastName as name, title
FROM Employees e
) as e1 CROSS JOIN (
SELECT e.FirstName + ' ' + e.LastName as name, title
FROM Employees e
) as e2
WHERE e1.name != e2.name and e1.title = e2.Title
ORDER by e1.name

--26. Display all the Managers who have more than 2 employees reporting to them.
SELECT e1.FirstName + ' ' + e1.LastName as name, e2.[#report employee]
FROM Employees as e1 JOIN (
SELECT count(e.EmployeeID) as [#report employee], e.ReportsTo
FROM Employees e
GROUP BY e.ReportsTo) as e2 on e1.EmployeeID = e2.ReportsTo
WHERE e2.[#report employee] > 2

--27. Display the customers and suppliers by city. The results should have the following columns
--City
--Name
--Contact Name,
--Type (Customer or Supplier)

select city, ContactName, 'Customer' as Type
from Customers
union
select city, ContactName, 'Supplier' as Type from Suppliers
