-- zad.1
Use AdventureWorks2022;

WITH TempEmployeeInfo
AS
 (
 SELECT Rate AS stawka 
 BusinessEntityID AS id_pracownika
 FROM HumanResources.EmployeePayHistory
 ) 
 SELECT * FROM TempEmployeeInfo;

 -- zad.2
 WITH sprzedaz_info
 AS (
 SELECT c.CompanyName, c.FirstName, c.LastName, 
 CONCAT (c.CompanyName, ' (', c.FirstName, ' ', c.LastName,') ') AS CompanyContact
 SUM (h.SubTotal) AS Revenue
 FROM SalesLT.Customer c
 INNER JOIN SalesLT.SalesOrderHeader h ON c.CustomerID= h.CustomerID)

SELECT CompanyContact, Revenue
FROM sprzedaz_info;

 -- zad.3
 WITH produkty_info
 AS (
 SELECT Name AS Category
 SUB (h.LineTotal) AS SalesValue
 FROM SalesLT.ProductCategory sc 
 INNER JOIN SalesLT.SalesOrderDetail d ON sc.ProductId =d.ProductID
 INNER JOIN SalesLT.SalesOrderHeader h ON d.SalesOrderID = h.SalesOrderID
 GROUP BY sc.Name
 )
 SELECT Category,SalesValue
FROM produkty_info
