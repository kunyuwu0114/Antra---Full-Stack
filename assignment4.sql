--1. Create a view named “view_product_order_[your_last_name]”, list all products and total ordered quantity for that product.
CREATE VIEW view_product_order_Wu AS
SELECT p.ProductID, count(od.Quantity) AS [total ordered quantity]
FROM Products AS p JOIN [Order Details] AS od ON p.ProductID = od.ProductID
GROUP BY p.ProductID
ORDER BY 

SELECT *
FROM view_product_order_Wu

--2. Create a stored procedure “sp_product_order_quantity_[your_last_name]” that accept product id as an input and total quantities of order as output parameter.
CREATE PROCEDURE sp_product_order_quantity_Wu
@pID int,
@tQuant int out
AS
BEGIN
SELECT @tQuant = [total ordered quantity]
FROM view_product_order_Wu
WHERE ProductID = @pID
END

--testing
BEGIN
declare @total_quant int
exec sp_product_order_quantity_Wu 2,@total_quant out
print @total_quant
END

--3. Create a stored procedure “sp_product_order_city_[your_last_name]” that accept product name as an input and top 5 cities that ordered most that product combined with the total quantity of that product ordered from that city as output.
CREATE PROCEDURE sp_product_order_city_Wu
@pName varchar(20)
AS
BEGIN
SELECT TOP 5 o.ShipCity as City, Count(p.ProductID) as [total quantity]
FROM Products AS p JOIN [Order Details] AS od ON p.ProductName = @Pname and p.ProductID = od.ProductID
	JOIN Orders AS o ON od.OrderID = o.OrderID
GROUP BY o.ShipCity
END

BEGIN
exec sp_product_order_city_Wu 'Chai'
END

--4. a.Create 2 new tables “people_your_last_name” “city_your_last_name”.
--   b.City table has two records: {Id:1, City: Seattle}, {Id:2, City: Green Bay}.
--   c.People has three records: {id:1, Name: Aaron Rodgers, City: 2}, {id:2, Name: Russell Wilson, City:1}, {Id: 3, Name: Jody Nelson, City:2}
--   d.Remove city of Seattle. If there was anyone from Seattle, put them into a new city “Madison”.
--   e.Create a view “Packers_your_name” lists all people from Green Bay.
--   f.If any error occurred, no changes should be made to DB. (after test) Drop both tables and view.

--a.Create 2 new tables “people_your_last_name” “city_your_last_name”.
CREATE TABLE city_Wu(
Id int primary key IDENTITY(1, 1),
City varchar(20)
)
CREATE TABLE people_Wu(
Id int primary key IDENTITY(1, 1),
name varchar(20),
CityID int foreign key references city_Wu(ID)
)
--b.City table has two records: {Id:1, City: Seattle}, {Id:2, City: Green Bay}.
INSERT INTO city_Wu values('Seattle'),('Green Bay')
SELECT *
FROM City_Wu
--c.People has three records: {id:1, Name: Aaron Rodgers, City: 2}, {id:2, Name: Russell Wilson, City:1}, {Id: 3, Name: Jody Nelson, City:2}
INSERT INTO people_Wu values('Aaron Rodgers',2),('Russell Wilson', 1),('Jody Nelson', 2)
SELECT *
FROM people_Wu
--d.Remove city of Seattle. If there was anyone from Seattle, put them into a new city “Madison”.
INSERT INTO city_Wu values('Madison')

UPDATE people_Wu
SET CityID = (SELECT id FROM city_Wu WHERE City = 'Madison')
WHERE CityID = (SELECT id FROM city_Wu WHERE City = 'Seattle')

SELECT *
FROM people_Wu

DELETE
FROM City_Wu
WHERE City = 'Seattle'

SELECT *
FROM City_Wu
--e.Create a view “Packers_your_name” lists all people from Green Bay.
CREATE VIEW Packers_Kunyu_Wu AS
SELECT p.Id, p.name
FROM City_Wu AS c JOIN people_Wu AS p ON c.Id = p.CityID
WHERE c.City = 'Green Bay'

SELECT *
FROM Packers_Kunyu_Wu
--

--f.If any error occurred, no changes should be made to DB. (after test) Drop both tables and view.
DROP TABLE IF EXISTS people_Wu
GO
DROP TABLE IF EXISTS city_wu

--5. Create a stored procedure “sp_birthday_employees_[you_last_name]” that creates a new table “birthday_employees_your_last_name” 
--   and fill it with all employees that have a birthday on Feb. (Make a screen shot) drop the table. Employee table should not be affected.
CREATE PROC sp_birthday_employees_Wu AS
BEGIN
SELECT * INTO birthday_employees_Wu
FROM Employees AS e
WHERE month(e.BirthDate) = 2
END

DROP TABLE IF EXISTS birthday_employees_Wu 
exec sp_birthday_employees_Wu
SELECT *
FROM birthday_employees_Wu

--6. How do you make sure two tables have the same data?
--	 Can use UNION to Check. Algirothm:
--   1. Let's say we have TableA and TableB, first check if they have the same column, it is easy to check by eyes. 
--   2. If They DO NOT have the same columns, then they are not same; if they do, go step 3.
--	 3. Count rows in TableA by SELECT count([primary key]) FROM TABLE A
--   4. Count rows in TableA UNION TableB by SELECT count([primary key]) FROM (SELECT * TABLE A UNION SELECT * TABLE B)
--   5. If result from step 3&4 gives the same result, then TableA and TableB have the same data.