USE Northwind

-- CREATE / ALTER / DROP - DDL (Data Definition Language)

-- Immer wenn wir Datenbankobjekte "bearbeiten" gelten diese Befehle

CREATE TABLE PurchasingOrders
(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	OrderDate date NOT NULL,
	ProductID INT not null
)

-- Tabelle Aufrufen
SELECT * FROM PurchasingOrders

-- Beziehung zwischen PurchasingOrders und Products anlegen �ber die ProductID:
ALTER TABLE PurchasingOrders
ADD FOREIGN KEY (ProductID) REFERENCES Products (ProductID)

-- Neue Spalte hinzuf�gen zu bestehender Table:
ALTER TABLE PurchasingOrders
ADD NeueSpalte INT

-- Spalte aus der bestehenden Table l�schen
ALTER TABLE PurchasingOrders
DROP COLUMN NeueSpalte

-- Spalte nach Datentyp �ndern:
ALTER TABLE PurchasingOrders
ALTER COLUMN TestDaten FLOAT NULL

-- INSERT -- Hinzuf�gen von Datens�tzen in bestehender Table

-- Alle Spalten befuellen
INSERT INTO PurchasingOrders
VALUES(GETDATE(), 10, 20.341)

-- Explizit einzelne Spalten befuellen:
INSERT INTO PurchasingOrders (OrderDate, ProductID, TestDaten)
VALUES (GETDATE(), 15, 15.43)

-- Tabelle Aufrufen
SELECT * FROM PurchasingOrders

-- Ergebnis einer SELECT-Abfrage k�nnen wir direkt Inserted werden
-- (Spaltenanzahl muss gleich sein & Datentypen kompatibel)
INSERT INTO PurchasingOrders
SELECT GETDATE(), 3, NULL

-- DELETE - L�schen von Datens�tzen in einem bestehendem Table
-- TRUNCATE 

-- Aufpassen! Ohne WHERE Filter werden ALLE Datens�tze gel�scht!
DELETE FROM PurchasingOrders
WHERE ID = 3

TRUNCATE TABLE PurchasingOrders

-- Prim�r-/Fremdschl�sselbeziehung verhindern das L�schen von Datens�tzen, weil dann andere DAtens�tze
-- sonst "ins leere laufen w�rden"
DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

-- UPDATE - �ndern von Spaltenwerten in einem vorhanden Datensatz
SELECT * FROM PurchasingOrders

UPDATE PurchasingOrders
SET TestDaten = 8
WHERE ID = 5

-- "Loeschen" von Werten: SET = NULL
UPDATE PurchasingOrders
SET TestDaten = NULL
WHERE ID = 5


-- Trage dich selber in die Tabelle ein (Employees). Bei den folgenden Spalten: 
--LastName, FirstName, Title, TitleOfCourtesy, BirthDate, 
--HireDate, City, Region, PostalCode, Country, HomePhone, ReportsTo

-- Bonus: Aendere die Werte danach um, in eine Person die frei erfunden ist

SELECT * FROM Employees

INSERT INTO Employees
(LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, City, Region, PostalCode, Address, Country, HomePhone, ReportsTo)
VALUES ('Libowicz', 'Philipp', 'Berlin Touri', 'Mr.', '20050213', '20230901', 'Burghausen', 'BGH', '84489', 'Max-Mustermann_Stra�e', 'Germany', '(206) 555-9857', 2) 

-- Transactions

SELECT * FROM PurchasingOrders

BEGIN TRANSACTION

UPDATE PurchasingOrders
SET TestDaten = 10


COMMIT --> ausf�hren und so �bernehmen
ROLLBACK