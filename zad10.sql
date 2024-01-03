-- zad.1
BEGIN TRANSACTION;
UPDATE Production.Product
SET ListPrice = ListPrice + 0.1*ListPrice
WHERE ProductID = 680

SELECT List Price FROM Production.Product
WHERE ProductID = 680

COMMIT;	

--zad. 2
BEGIN TRANSACTION;

INSERT INTO Production.Product (ProductID, Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color, SafetyStockLevel, ReorderPoint, 
StandardCost, ListPrice, Size, SizeUnitMeasureCode, WeightUnitMeasureCode, Weight, DaysToManufacture, ProductLine, Class, Style, 
ProductSubcategoryID, ProductModelID, SellStartDate, SellEndDate, DiscontinuedDate, rowguid, ModifiedDate)
VALUES ( 418, 'Szampon', 56783, 1, 1, 'red', 45, 987, 30, 37, '30x10x20', 'cm', 'g','500','28','R','M','U', 389009,765,'27.04.2016','13.09.2022','30.11.2019',newid(),getdate()) 
COMMIT;

-- zad.3 
BEGIN TRANSACTION;
 DELETE FROM Production.Product
 WHERE ProductID = 418;
ROLLBACK;

-- zad.4
BEGIN TRANSACTION;
UPDATE Production.Product
SET StandardCost = 1.1*StandardCost;
	IF (SELECT SUM(StandardCost) FROM Production.Product <= 50000) 
	BEGIN
			COMMIT; -- nie zapisuje zmian
	END
	ELSE BEGIN
	ROLLBACK;
	END

-- zad.5
BEGIN TRANSACTION;
DROP INDEX AK_Product_ProductNumber ON Production.Product;
DROP INDEX AK_Product_Name ON Production.Product;

BEGIN TRY 
INSERT INTO Production.Product (ProductID, Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color, SafetyStockLevel, ReorderPoint, 
StandardCost, ListPrice, Size, SizeUnitMeasureCode, WeightUnitMeasureCode, Weight, DaysToManufacture, ProductLine, Class, Style, 
ProductSubcategoryID, ProductModelID, SellStartDate, SellEndDate, DiscontinuedDate, rowguid, ModifiedDate)
VALUES ( 561, 'Szampon', 56783, 1, 1, 'red', 45, 987, 30, 37, '30x10x20', 'cm', 'g','500','28','R','M','U', 389009,765,'27.04.2016','13.09.2022','30.11.2019',newid(),getdate())
COMMIT;
END TRY

BEGIN CATCH 
ROLLBACK;
END CATCH;

-- zad.6
BEGIN TRANSACTION;
UPDATE Sales.SalesOrderDetail
SET OrderQty = OrderQty + 1;
IF EXISTS (SELECT 1 FROM Sales.SalesOrderDetail WHERE OrderQty = 0 )
	BEGIN
		ROLLBACK;
		END 
		ELSE
		COMMIT;
		END

-- zad.7
BEGIN TRANSACTION;
DECLARE @srednia DECIMAL(10, 2);
SELECT @srednia = AVG(StandardCost) FROM Production.Product;

UPDATE Production.Product
SET StandardCost = @srednia
WHERE StandardCost > @srednia;
IF @@ROWCOUNT > 200
BEGIN
    ROLLBACK;
END
ELSE
BEGIN
    COMMIT;
END