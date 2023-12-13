-- zad.1
CREATE OR REPLACE FUNCTION fib (@n INT)
RETURNS BIGINT 
AS
BEGIN
    IF @n <= 0
        RETURN 0;
    ELSEIF @n = 1
        RETURN 1;
    ELSE
        RETURN fib(@n - 1) + fib(@n - 2);
    END IF;
END;

CREATE OR REPLACE PROCEDURE printFib (@n INT)
AS
DECLARE
@number INT = 1;
@res BIGINT = 0;
BEGIN
    WHILE @number <= @n
    BEGIN
        SET @res = fib(@number);
        SELECT @res;
        SET @number = @number + 1;
    END;
END;

-- zad.2
CREATE OR REPLACE TRIGGER Persons_Update
AFTER INSERT OR UPDATE ON Person.Person
FOR EACH ROW
BEGIN
    :new.LastName := UPPER(:new.LastName); -- new odnosi sie do akut wiersza z kolumny LastName
END;

-- zad.3
CREATE OR REPLACE FUNCTION Tax_Change()
RETURNS TRIGGER AS
DECLARE 
    tax_old smallmoney;
    tax_new smallmoney;
    calc smallmoney;
BEGIN 
    tax_old := OLD.TaxRate; -- przypisanie starych i nowej wartości do zmiennych.
    tax_new := NEW.TaxRate;
    calc := ABS((tax_old - tax_new) / tax_old) * 100;

    IF calc > 30 THEN
        RAISE EXCEPTION 'Blad: Nastapila zmiana wartosci TaxRate o wiecej niz 30%';
    END IF;

    RETURN NEW;
END;

CREATE TRIGGER taxRateMonitoring
BEFORE UPDATE ON Sales.SalesTaxRate
FOR EACH ROW
EXECUTE FUNCTION Tax_Change();