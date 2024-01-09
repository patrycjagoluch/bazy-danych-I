USE [AdventureWorks2022]

SELECT CustomerID, StoreID, TerritoryID
FROM Sales.Customer
WHERE PersonID = 200;

CREATE INDEX index_personID ON Sales.Customer (PersonID);

SELECT CustomerID, StoreID, TerritoryID
FROM Sales.Customer
WHERE PersonID = 200;