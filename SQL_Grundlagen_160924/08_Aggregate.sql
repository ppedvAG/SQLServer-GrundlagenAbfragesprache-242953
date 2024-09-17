USE Northwind
-- Aggregatfunktion: Führt eine Berechnung auf einer Menge von Werten durch und gibt
--					 einen einzigen Wert zurück
-- Ausnahme: COUNT(*)

-- 5 grundsätzlichen verschiedenen Funktionen

SELECT
SUM(Freight) as summe,
MIN(Freight) as Minimum,
MAX(Freight) as Maximum,
AVG(Freight) as Durchschnitt,
COUNT(ShippedDate) as ZähleSpalte, COUNT(*) as ZähleAlles
FROM Orders

SELECT ShippedDate from Orders

-- AVG selber berechnen
SELECT SUM(Freight) / COUNT(*) FROM Orders

SELECT CustomerID, SUM(Freight) FROM Orders
-- Lösung über Group by
-- Group by - Fasst mehrere Werte in Gruppen zusammen

SELECT CustomerID, Freight FROM Orders
ORDER BY CustomerID

SELECT CustomerID, SUM(Freight) FROM Orders
GROUP BY CustomerID

-- Quantity Summe pro ProductName für Produkte der Kategorien 1-4
SELECT ProductName, SUM(Quantity) as SummeStueckZahl from [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE CategoryID IN (1,2,3,4)
GROUP BY ProductName
ORDER BY SummeStueckZahl

-- Verkaufte Stueckzahlen pro Produkt, aber nur ueber 1000
-- Geht so nicht:
SELECT ProductName, SUM(Quantity) as SummeStueckZahl from [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE SUM(Quantity) > 1000
GROUP BY ProductName
ORDER BY SummeStueckZahl DESC


-- HAVING funktioniert 1zu1 wie unser WHERE, kann aber gruppierte/aggregierte Werte nachtraeglich FILTERN
SELECT ProductName, SUM(Quantity) as SummeStueckZahl from [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
--WHERE SUM(Quantity) > 1000
GROUP BY ProductName
HAVING SUM(Quantity) > 1000
ORDER BY SummeStueckZahl DESC


-- Mit Systemfunktionen
SELECT ProductName, SUM(Quantity) as SummeStueckZahl, DATEPART(YEAR, OrderDate) as Datum from [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
--WHERE SUM(Quantity) > 1000
GROUP BY ProductName, DATEPART(YEAR, OrderDate)
HAVING SUM(Quantity) > 1000
ORDER BY SummeStueckZahl DESC

