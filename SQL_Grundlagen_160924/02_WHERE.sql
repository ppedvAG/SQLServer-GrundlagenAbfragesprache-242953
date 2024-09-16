USE Northwind

-- WHERE: filtert Ergebniszeilen
SELECT * FROM Customers
WHERE Country = 'Germany'

-- = sucht nach exakten Treffern
SELECT * FROM Customers
WHERE Country = 'Germany'

-- andere boolsche Vergleichsoperatoren
-- (<, >, <=, >=, != bzw. <>)

SELECT * FROM Orders
WHERE Freight >= 500

SELECT * FROM Customers
WHERE Country != 'Germany'

-- Kombinieren mit AND und OR
SELECT * FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin'

SELECT * FROM Customers
WHERE Country = 'Germany' OR City = 'Paris'

-- AND = "Beide" Bedingungnen müssen wahr sein
-- OR = Ein Ausdruck muss wahr sein

-- Vorsicht! Wenn wir AND und OR kombieren
SELECT * FROM Customers
WHERE (City = 'Paris' OR City = 'Berlin') AND Country = 'Germany'
-- AND "ist stärker bindent" als OR; Notfalls müssen Klammern gesetzt werden!

SELECT * FROM Orders
WHERE Freight >= 100 AND Freight <= 500

-- Alternativ mit BETWEEN, inkl. Randwerte
SELECT * FROM Orders
WHERE Freight BETWEEN 100 AND 500

SELECT * FROM Customers
WHERE Country = 'Germany' OR Country = 'Brazil' OR Country = 'France' 

-- Alternative IN (Wert1, Wert2, Wert3)
SELECT * FROM Customers
WHERE Country IN ('Brazil', 'Germany', 'France')
-- IN verbindet mehrere OR Bedingungen die sich auf die selbe Spalte beziehen

-- Übungen:

-- 1. Alle ContactNames die als Title "Owner" haben
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle = 'Owner'

-- 2. Alle Order Details (Tabelle) die die ProductID 43 haben
SELECT * FROM [Order Details]
WHERE ProductID = 43

-- 3. Alle Kunden aus Paris, Berlin, Madrid oder Brazilien
SELECT * FROM Customers
WHERE City IN ('Paris', 'Berlin', 'Madrid') OR Country = 'Brazil'

-- 4. Alle Kunden die eine Fax Nummer haben
SELECT * FROM Customers
WHERE Fax != 'NULL'

SELECT * FROM Customers
WHERE Fax IS NOT NULL

SELECT Fax as F, Country, City FROM Customers
WHERE Fax IS NULL
ORDER BY 2, 3 DESC



