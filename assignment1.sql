USE AdventureWorks2019
GO

SELECT *
FROM Production.Product

--1. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, 
--	 with no filter. 

SELECT P.ProductID, P.Name, P.Color, P.ListPrice
FROM Production.Product AS P

--2. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, 
--   excludes the rows that ListPrice is 0.

SELECT P.ProductID, P.Name, P.Color, P.ListPrice
FROM Production.Product AS P
WHERE P.ListPrice != 0


--3. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, 
--   the rows that are NULL for the Color column.

SELECT P.ProductID, P.Name, P.Color, P.ListPrice
FROM Production.Product AS P
WHERE P.Color IS NULL

--4. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, 
--   the rows that are not NULL for the Color column.

SELECT P.ProductID, P.Name, P.Color, P.ListPrice
FROM Production.Product AS P
WHERE P.Color IS NOT NULL

--5. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, 
--   the rows that are not NULL for the column Color, and the column ListPrice has a value greater than zero.
SELECT P.ProductID, P.Name, P.Color, P.ListPrice
FROM Production.Product AS P
WHERE P.Color IS NOT NULL and P.ListPrice > 0
--WHERE (P.Color IS NOT NULL) and (P.ListPrice>0)

--6. Write a query that concatenates the columns Name and Color from the Production.Product table by excluding the rows 
--   that are null for color.
SELECT P.Name + ' ' + P.Color AS 'Result'
FROM Production.Product AS P
WHERE P.Color IS NOT NULL


--7. Write a query that generates the following result set from Production.Product:
--NAME: LL Crankarm  --  COLOR: Black
--NAME: ML Crankarm  --  COLOR: Black
--NAME: HL Crankarm  --  COLOR: Black
--NAME: Chainring Bolts  --  COLOR: Silver
--NAME: Chainring Nut  --  COLOR: Silver
--NAME: Chainring  --  COLOR: Black

SELECT 'Name: ' + P.Name + '  --  COLOR: ' + P.Color AS 'Result'
FROM Production.Product AS P
WHERE P.Color IS NOT NULL
--It is not asked to exclude NULL, but operation with NULL will result a NULL, So using WHERE to exclude NULL

--8. Write a query to retrieve the to the columns ProductID and Name from the Production.Product table filtered by ProductID 
--   from 400 to 500
SELECT P.ProductID, P.Name
FROM Production.Product AS P
WHERE P.ProductID BETWEEN 400 and 500

--9. Write a query to retrieve the to the columns  ProductID, Name and color from the Production.Product table restricted to
--   the colors black and blue
SELECT P.ProductID, P.Name, P.Color
FROM Production.Product AS P
WHERE P.Color in ('black','blue')

--10. Write a query to get a result set on products that begins with the letter S. 
SELECT P.ProductID, P.Name, P.Color, P.ListPrice
FROM Production.Product AS P
WHERE P.Name LIKE 'S%'
--It is mentioned in clasee that it is better to avoid to use *
--So I just select four columns which are listed in Question 1
--According to Question 1, these four columns are supposed to be interested columnns.

--11. Write a query that retrieves the columns Name and ListPrice from the Production.Product table. Your result set should
--    look something like the following. Order the result set by the Name column. 
--Name								ListPrice
--Seat Lug							0,00
--Seat Post							0,00
--Seat Stays						0,00
--Seat Tube							0,00
--Short-Sleeve Classic Jersey, L	53,99
--Short-Sleeve Classic Jersey, M	53,99
SELECT P.Name, P.ListPrice
FROM Production.Product AS P
ORDER BY P.Name


--12. Write a query that retrieves the columns Name and ListPrice from the Production.Product table. Your result set should 
--    look something like the following. Order the result set by the Name column. The products name should start with either
--    'A' or 'S'
--Name                              ListPrice
--Adjustable Race                   0,00
--All-Purpose Bike Stand            159,00
--AWC Logo Cap                      8,99
--Seat Lug                          0,00
--Seat Post                         0,00
SELECT P.Name, P.ListPrice
FROM Production.Product AS P
WHERE P.Name LIKE '[A,S]%'
ORDER BY P.Name


--13. Write a query so you retrieve rows that have a Name that begins with the letters SPO, but is then not followed by the 
--    letter K. After this zero or more letters can exists. Order the result set by the Name column.
SELECT P.Name, P.ListPrice
FROM Production.Product AS P
WHERE P.Name LIKE 'SPO[^K]%'
ORDER BY P.Name


--14. Write a query that retrieves unique colors from the table Production.Product. Order the results  in descending  manner
SELECT DISTINCT P.Color
FROM Production.Product AS P
WHERE P.Color IS NOT NULL
ORDER BY P.Color DESC


--15. Write a query that retrieves the unique combination of columns ProductSubcategoryID and Color from the Production.Product
--    table. Format and sort so the result set accordingly to the following. We do not want any rows that are NULL.in any of the
--    two columns in the result.
SELECT DISTINCT P.ProductSubcategoryID, P.Color
FROM Production.Product AS P
WHERE P.ProductSubcategoryID IS NOT NULL and P.Color IS NOT NULL
ORDER BY P.ProductSubcategoryID, P.Color