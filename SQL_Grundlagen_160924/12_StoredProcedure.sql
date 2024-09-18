USE Northwind
GO
-- Stored Procedures / gespeicherte Prozedure

/*
	- Sind gespeicherte SQL Anweisungen (nicht nur SELECT, sondern auch alles andere)
	- Arbeiten mit Variablen
	- Praktisch zum "automatisieren" von Code
	- Prozeduren verwenden ihren QueryPlan immer wieder 

*/

CREATE PROCEDURE spRechnungsByOrderID @OrderID INT
AS
SELECT * FROM vRechnungsDaten
WHERE OrderID = @OrderID
GO

-- Prozedur ausführen
EXEC spRechnungsByOrderID 10251
GO


-- Prozedur erstellt, Kunden hinzufügt
CREATE PROCEDURE spNewCustomer
@CustomerID char(5), @CompanyName varchar(40),
@Country varchar(30), @City varchar(30)
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNewCustomer ALDIS, 'ppedv Ag', Germany, Burghausen

SELECT * FROM Customers
GO

-- Default Werte:
CREATE PROCEDURE spKundenNachLanCity 
@Country varchar(50) = 'Germany', @City varchar(50) = 'Berlin'
AS
SELECT * FROM Customers
WHERE Country = @Country AND City = @City
GO

EXEC spKundenNachLanCity France, Paris

-- Variablen:

DECLARE @OrderID INT = 10250

SELECT * FROM vRechnungsDaten
WHERE OrderID = @OrderID

SET @OrderID = 10251

SELECT * FROM vRechnungsDaten
WHERE OrderID = @OrderID
