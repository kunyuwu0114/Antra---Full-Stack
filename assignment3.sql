USE Northwind
GO

--1. List all cities that have both Employees and Customers.
SELECT DISTINCT e.city
FROM Employees AS e JOIN Customers as c on e.city=c.City

--2. List all cities that have Customers but no Employee.
--a. Use sub-query
--b. Do not use sub-query
--a.
SELECT DISTINCT c.city
FROM Customers AS c
WHERE c.city not in (
SELECT e.city
FROM Employees AS e)
--b.
SELECT DISTINCT c.city
FROM Customers AS c
EXCEPT
SELECT e.city
FROM Employees AS e
--b. another way, not sure why it gives different result
SELECT DISTINCT c.city
FROM Customers AS c, Employees AS e
WHERE c.City != e.city;

--3. List all products and their total order quantities throughout all orders.
SELECT p.ProductName, sum(od.Quantity) AS [total order quantities]
FROM Products AS p JOIN [Order Details] AS od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY [total order quantities] DESC

--4. List all Customer Cities and total products ordered by that city.
select c.city , sum(p.ProductID) AS [total products]
FROM Products p INNER JOIN [Order Details] od ON od.ProductID = p.ProductID
	INNER JOIN Orders o ON o.OrderID = od.OrderID
	INNER JOIN Customers c ON c.CustomerID = o.CustomerID
GROUP BY c.City
ORDER BY  [total products] DESC

--5. List all Customer Cities that have at least two customers.
--a. Use union
--b. Use sub-query and no union

--have to use union or sub-query?
SELECT city
FROM Customers
GROUP BY city
HAVING count(customerid) >= 2
--a.
SELECT city 
FROM Customers
GROUP BY city
HAVING count(customerid) = 2
UNION
SELECT city
FROM Customers
GROUP BY city
HAVING count(customerid) > 2
--b.
SELECT DISTINCT city 
FROM Customers
WHERE city IN (
SELECT city
FROM Customers
GROUP BY city
HAVING count(customerid) >= 2)

--6. List all Customer Cities that have ordered at least two different kinds of products.
SELECT o.ShipCity AS city
FROM Orders AS o JOIN [Order Details] AS od on o.OrderID = od.OrderID
	JOIN Products AS p on od.ProductID = p.ProductID
GROUP BY o.ShipCity
HAVING sum(p.ProductID) >= 2 

--7. List all Customers who have ordered products, but have the ‘ship city’ on the order different from their own customer cities.
SELECT DISTINCT c.CustomerID, c.CompanyName, c.ContactName, c.City, o.ShipCity
FROM Customers AS c JOIN Orders as o ON c.CustomerID = o.CustomerID
WHERE c.City != o.ShipCity

--8. List 5 most popular products, their average price, and the customer city that ordered most quantity of it.
SELECT TOP 5 p.productname, avg(p.UnitPrice) AS [Average price], d.city
FROM Products AS p INNER JOIN [Order Details] AS od ON p.ProductID = od.ProductID
	INNER JOIN Orders AS c ON od.OrderID = c.OrderID
	INNER JOIN Customers AS d ON c.CustomerID = c.CustomerID
GROUP BY p.ProductName, d.city
ORDER BY sum(od.quantity) DESC

--9. List all cities that have never ordered something but we have employees there.
--a. Use sub-query
--b. Do not use sub-query
--a.
SELECT city
FROM customers AS c1
WHERE c1.city IN (
SELECT c2.city 
FROM customers c2 LEFT JOIN orders AS o ON c2.customerid = o.customerid and o.employeeid IN (
SELECT employeeid FROM orders)
GROUP BY c2.city HAVING count(orderid) = 0)
--b.
SELECT c.city , count(orderid)
FROM customers AS c JOIN orders o on c.customerid  = o.customerid 
	JOIN employees e on e.EmployeeID = o.EmployeeID 
GROUP BY c.city
HAVING count(orderid) = 0


--10.  List one city, if exists, that is the city from where the employee sold most orders (not the product quantity) is, and also the city of most total quantity of products ordered from. (tip: join  sub-query)
SELECT DISTINCT c.city
FROM orders o JOIN customers c ON o.CustomerID = c.CustomerID
WHERE c.city IN (
SELECT TOP 1 c.city
FROM Products p JOIN [Order Details] od ON od.ProductID = p.ProductID 
	JOIN Orders o ON o.OrderID = od.OrderID
	JOIN Customers c ON c.CustomerID = c.CustomerID
GROUP BY c.City
ORDER BY count(o.orderid) DESC)
and --the where statement
c.city IN (
SELECT TOP 1 c.city
FROM Products p JOIN [Order Details] od ON od.ProductID = p.ProductID 
	JOIN Orders o ON o.OrderID = od.OrderID
	JOIN Customers c ON c.CustomerID = c.CustomerID
GROUP BY c.City
ORDER BY count(od.ProductID) DESC)

--11. How do you remove the duplicates record of a table?
--USE DISTINCT statement