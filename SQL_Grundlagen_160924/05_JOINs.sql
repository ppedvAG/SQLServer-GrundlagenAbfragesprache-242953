USE Northwind

/*

	JOIN Syntax:
	SELECT * FROM TabelleA
	JOIN TabelleB ON A.Spalte1 = B.Spalte1
*/

-- Verknüpfungspunkt zwischen Shippers und Orders

-- Verknüpfung von Orders & Customers noch dazu Order Details
SELECT  Orders.*, Customers.CompanyName  FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID

-- Übungen:
-- 1. Welche Produkte (ProductName) hat "Leverling" bisher verkauft?
SELECT DISTINCT ProductName, LastName FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE LastName = 'Leverling'

-- 2. Was war die größte Bestellmenge (Quantity) von Chai Tee (ProductName)
SELECT TOP 1 ProductName, Quantity FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
WHERE ProductName = 'Chai'
ORDER BY Quantity DESC

-- 3. Wieviele Bestellungen haben Kunden aus Argentinien aufgegeben
SELECT OrderID
FROM Customers JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'Argentina'


-----------------------------------------
-- Outer Joins: LEFT/RIGHT und FULL OUTER

-- LEFT: 830 Rows
SELECT * FROM Orders 
LEFT JOIN Customers ON Customers.CustomerID = Orders.CustomerID

-- Right: 832 Rows (Z. 189 & 502)
SELECT * FROM Orders
RIGHT JOIN Customers ON Customers.CustomerID = Orders.CustomerID

-- JOIN "invertieren", d.h keine Schnittmenge anzeigen, durch filtern nach NULL
SELECT * FROM Orders
RIGHT JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL

-- Full Outer Join
SELECT * FROM Orders
FULL OUTER JOIN Customers ON Customers.CustomerID = Orders.CustomerID

-- Invertiert Full Outer Join
SELECT * FROM Orders
FULL OUTER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.CustomerID IS NULL OR Orders.OrderID IS NULL

-- CROSS JOIN: Erstellt karthesisches Produkt zweier Tabellen (A x B) (830 x 91)
SELECT * FROM Orders CROSS JOIN Customers

-- SELF JOIN
SELECT E1.EmployeeID, E1.LastName as Vorgesetzter, E2.EmployeeID, E2.LastName as Angestellter 
FROM Employees as E1
JOIN Employees as E2 ON E1.EmployeeID = E2.ReportsTo