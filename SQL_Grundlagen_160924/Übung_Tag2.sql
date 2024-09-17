-- 1. Gab es Bestellungen (OrderID) an Wochenendtagen (OrderDate)?
SELECT OrderID, DATEPART(WEEKDAY, OrderDate) as Wochentag FROM Orders
WHERE DATEPART(WEEKDAY, OrderDate) IN (6,7)
ORDER BY Wochentag DESC

-- 2. Verkaufte Stueckzahlen (Quantity) pro ProduktKategorie (CategoryName) (8 Ergebniszeilen)
SELECT CategoryName, SUM(Quantity) as Menge FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName

-- 3. Wieviele Bestellungen hat jeder Mitarbeiter bearbeitet? (9 Ergebniszeilen)
SELECT LastName, Firstname, COUNT(OrderID) as Bestellungen FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY LastName, FirstName
ORDER BY Bestellungen DESC

-- 4. Was war das meistverkaufte Produkt im Jahr 1998 (Productname)? Wieviel Stück (Quantity)?
SELECT TOP 1 ProductName, SUM(Quantity) as Verkaufsmenge FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON [Order Details].OrderID = Orders.OrderID
WHERE DATEPART(YEAR, OrderDate) = 1998
GROUP BY ProductName
ORDER BY Verkaufsmenge Desc

-- 5. In welcher Stadt (City von Customers) waren „Wimmers gute Semmelknödel“ am beliebtesten (Quantity)?
SELECT Top 1 City, SUM(Quantity) as Verkaufsmenge FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE ProductName = 'Wimmers gute SemmelknÃ¶del'
GROUP BY City
Order By Verkaufsmenge DESC

-- 6. Welcher Spediteur (Shippers) war durchschnittlich am günstigsten? (Freight)
SELECT CompanyName, AVG(Freight) as AvgFreight FROM Orders
JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
GROUP BY CompanyName
ORDER BY AvgFreight

-- 7. Hat „Andrew Fuller“ (Employee) schonmal Produkte der Kategorie 
--	„Seafood“ (Categories) verkauft?
--	Wenn ja, wieviel Lieferkosten sind 
--	dabei insgesamt entstanden (Freight)?
--	Das ganze mit Temporaere Tabellen machen (Ergebnis da reinspeichern)
SELECT DISTINCT SUM(Freight) as Lieferkosten
INTO #TempTable
FROM Employees
JOIN Orders on Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE Employees.LastName = 'Fuller' AND Categories.CategoryName = 'Seafood'

SELECT * FROM #TempTable
GO

--Erstellen Sie einen Bericht, der die Gesamtzahl der 
--Bestellungen nach Kunde seit dem 31. Dezember 1996 anzeigt. 
--Der Bericht sollte nur Zeilen zurückgeben, 
--für die die Gesamtzahl der Aufträge größer als 15 ist (5 Zeilen)
CREATE VIEW vBericht AS
SELECT CustomerID, COUNT(OrderID) as Bestellungen FROM Orders
WHERE OrderDate >= '19961231'
GROUP BY CustomerID
HAVING COUNT(OrderID) > 15
GO

-- View Aufrufen
SELECT * FROM vBericht
