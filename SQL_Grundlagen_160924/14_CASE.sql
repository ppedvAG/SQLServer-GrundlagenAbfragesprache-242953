USE Northwind

-- CASE - unterscheiden wir definierte Fälle, die die Ausgabe abändern

SELECT UnitsInStock,
CASE
	WHEN UnitsInStock < 10 THEN 'Nachbestellen!'
	WHEN UnitsInStock >= 10 THEN 'Passt.'
END as Prüfung
FROM Products

-- Alternativ mit ELSE einen "Notausgang" definieren:
SELECT UnitsInStock,
CASE
	WHEN UnitsInStock < 10 THEN 'Nachbestellen!'
	WHEN UnitsInStock >= 10 THEN 'Passt.'
	ELSE 'Fehler'
END as Prüfung
FROM Products

-- Funktioniert auch mit UPDATE:
UPDATE Customers
SET City =
CASE
	WHEN Country = 'Germany' THEN 'Berlin'
	WHEN Country = 'France' THEN 'Paris'
	ELSE City
END

SELECT City, Country FROM Customers

-- Auch im GROUP BY
SELECT SUM(UnitsInStock), UnitsInStock,
CASE
	WHEN UnitsInStock < 10 THEN 'Nachbestellen!'
	WHEN UnitsInStock >= 10 THEN 'Passt.'
	ELSE 'Fehler'
END as Prüfung
FROM Products
GROUP BY UnitsInStock,
CASE
	WHEN UnitsInStock < 10 THEN 'Nachbestellen!'
	WHEN UnitsInStock >= 10 THEN 'Passt.'
	ELSE 'Fehler'
END