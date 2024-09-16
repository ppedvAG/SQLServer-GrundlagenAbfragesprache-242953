USE Northwind

-- 1. Alle Produkte (ProductNames) aus den Kategorien "Beverages" und "Produce"
-- (CategoryName in Categories)
SELECT * FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName IN ('Beverages', 'Produce')

-- 2. Alle Bestellungen (Orders) bei denen ein Produkt verkauft wurde, das nicht mehr gefuehrt wird
-- (Discontinued = 1)
SELECT * FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE Discontinued = 1

-- 3. Alle Produkte der Category "Beverages" (Categories)
SELECT * FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName = 'Beverages'

-- 4. Alle ShipPostalCodes anzeigen lassen, die mit 0, 2, 4 beginnen
SELECT ShipPostalCode FROM Orders
WHERE ShipPostalCode LIKE '[024]%'

-- 5. Haben wir Produkteinheiten im Lager (UnitsInStock), die aber nicht nicht mehr verkauft werden
-- Wenn "ja" dann müssen wir den Wert berechnen davon
SELECT ProductName, UnitsInStock * UnitPrice as Wert FROM Products
WHERE Discontinued = 1 AND UnitsInStock != 0
ORDER BY Wert