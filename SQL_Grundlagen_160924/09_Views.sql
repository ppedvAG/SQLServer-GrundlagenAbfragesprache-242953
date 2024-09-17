USE Northwind
-- Views: Erzeugt eine Virtuelle Tabelle, deren Inhalt durch eine Abfrage definiert wird

/*
	Vorteile:
	- Views sind immer aktuell (aktuelle Daten)
		=> beim Aufruf der View wird das hinterlegte Statement ausgef�hrt
	- Sicherheit: User nur die View lesen darf, oder auch ver�ndern darf
	- Um komplexere Abfragen zu speichern
*/

CREATE VIEW vRechnungsDaten AS
SELECT
Orders.OrderID, 
Customers.CustomerID, Customers.CompanyName, Customers.Country, Customers.City, Customers.PostalCode, Customers.Address,
Orders.Freight, Orders.OrderDate,
Employees.LastName,
CAST(SUM((UnitPrice * Quantity) * (1 - Discount)) + Freight as decimal(10,2)) as SummeBestPosi 
FROM [Order Details]
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Orders.OrderID, 
Customers.CustomerID, Customers.CompanyName, Customers.Country, Customers.City, Customers.PostalCode, Customers.Address,
Orders.Freight, Orders.OrderDate,
Employees.LastName


-- Aufruf der View
SELECT * FROM vRechnungsDaten