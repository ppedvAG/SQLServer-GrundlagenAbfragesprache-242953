USE Northwind
-- String Funktionen bzw. Text-Datentypen manipulieren

-- LEN gibt die laenge eines Strings zurück (Rückgabe als INT)
SELECT CompanyName, LEN(CompanyName) FROM Customers
--WHERE LEN(CompanyName) > 10

-- LEFT/RIGHT, geben die "linken" oder die "rechten" x Zeichen eines Strings zurückgeben
SELECT CompanyName, LEFT(CompanyName, 5) FROM Customers
SELECT CompanyName, RIGHT(CompanyName, 5) FROM Customers

-- SUBSTRING(Spalte, x, y) springt zu Position X in einem String und gibt y Zeichen aus
SELECT SUBSTRING(CompanyName, 5, 10), CompanyName FROM Customers

-- STUFF(Spalte, x, y, replace) ersetzt y Zeichen eines Strings ab Position x
-- mit dem "replace" wert (optional)
SELECT STUFF(Phone, LEN(Phone) - 4, 5, 'XXXXX'), Phone FROM Customers

-- PATINDEX sucht nach "Schema" (wie LIKE) in einem String und gibt Position aus,
-- an der das Schema das erste mal gefunden wurde
SELECT PATINDEX('%m%', CompanyName), CompanyName FROM Customers

-- CONCAT fügt mehrere Strings in die selbe Spalte zusammen
SELECT CONCAT(FirstName, ' ', LastName) as GanzerName FROM Employees
SELECT FirstName + ' ' + LastName as GanzerName FROM Employees



-- Datumsfunktionen
SELECT GETDATE() -- aktuelle Systemzeit mit Zeitstempel

SELECT YEAR(OrderDate) as Jahr, MONTH(OrderDate) as Monat, DAY(OrderDate) as Tag,
OrderDate FROM Orders

/*
	DE: 1. Montag, 2. Dienstag, 3. Mittwoch, 4.Donnerstag, 5.Freitag, 6.Samstag, 7.Sonntag
	EN: 1. Sonntag, 2. Montag, 3.Dienstag, 4. Mittwoch, 5.Donnerstag, 6. Freitag, 7.Samstag
*/

-- "Zieht" ein gewünschtes Intervall aus einem Datum
SELECT
DATEPART(YEAR, OrderDate) as Jahr,
DATEPART(QUARTER, OrderDate) as Quartal,
DATEPART(WEEK, OrderDate) as KW,
DATEPART(WEEKDAY, OrderDate) as Wochentag,
DATEPART(HOUR, OrderDate) as Stunde
FROM Orders

-- Zieht den Intervall Namen aus einem Datum
SELECT DATENAME(MONTH, OrderDate), DATENAME(WEEKDAY, OrderDate),
DATEPART(WEEKDAY, OrderDate) OrderDate FROM Orders

-- Datum addieren/subtrahieren
SELECT DATEADD(DAY, 14, GETDATE())
SELECT DATEADD(DAY, -14, GETDATE())

-- Differenz in Intervall zwischen 2 Datum
SELECT DATEDIFF(DAY, '20050213', GETDATE())
SELECT DATEDIFF(YEAR, OrderDate, GETDATE()), OrderDate FROM Orders

-- Übung:
-- 1. Alle Bestellungen (Orders) aus Q2 in 1997
SELECT * FROM Orders
WHERE OrderDate BETWEEN '01.04.1997' AND '30.06.1997' -- 'YYYYMMDD' oder 'DD.MM.YYYY'

--> Datumsfunktionen
SELECT * FROM Orders
WHERE DATEPART(YEAR, OrderDate) = 1997 AND DATEPART(QUARTER, OrderDate) = 2

-- 2. Alle Produkte (ProductNames) die um Weihnachten herum (+-10 Tage) in
-- 1996 verkauft wurden
SELECT DISTINCT ProductName FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details]. OrderID
WHERE OrderDate BETWEEN '19961214' AND '19970103'

-- 3. Alle Bestellungen (Orders) aus den USA (Customers Country) die im Jahr 1997 aufgegeben wurden
-- OrderDate in Orders
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'USA' AND OrderDate BETWEEN '19970101' AND '19971231'

SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'USA' AND DATEPART(YEAR, OrderDate) = 1997


-- 4. Welches Produkt (ProductName) hatte die groeßte Bestellmenge (Quantity in OD) im Februar 1998?
SELECT TOP 1 ProductName FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE DATEPART(YEAR, OrderDate) = 1998 AND DATEPART(MONTH, OrderDate) = 2
ORDER BY Quantity DESC

-- 5. Wieviele Bestellungen kamen aus Spain (Customers) in Quartal 2 1997?
--    Sind es mehr oder weniger als aus Frankreich?

SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'Spain' AND DATEPART(YEAR, OrderDate) = 1997
AND DATEPART(QUARTER, OrderDate) = 2
UNION
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'France' AND DATEPART(YEAR, OrderDate) = 1997
AND DATEPART(QUARTER, OrderDate) = 2

-- Typumwandlung

-- CAST oder CONVERT, wandeln unsere Datentypen in der Ausgabe um
-- konvertierung von datetime -> date
SELECT CAST(OrderDate as date) FROM Orders
SELECT OrderDate FROM Orders

SELECT CONVERT(date, OrderDate) FROM Orders

-- ISNULL prüft auf NULL Werte und ersetzt diese wenn gewünscht
SELECT ISNULL(Fax, 'Nicht vorhanden!') as KeineFax, Fax FROM Customers

-- Format + Unterabfrage
SELECT FORMAT((SELECT CONVERT(date, '20050213')), 'D', 'zh-cn')

--SELECT TOP (5) CurrencyRateID,
--    EndOfDayRate,
--    FORMAT(EndOfDayRate, 'N', 'en-us') AS 'Numeric Format',
--    FORMAT(EndOfDayRate, 'G', 'en-us') AS 'General Format',
--    FORMAT(EndOfDayRate, 'C', 'en-us') AS 'Currency Format'
--FROM Sales.CurrencyRate
--ORDER BY CurrencyRateID;

SELECT TOP 5 Freight, 
	FORMAT(Freight, 'N', 'de-de'),
	FORMAT(Freight, 'G', 'de-de'),
	FORMAT(Freight, 'C', 'de-de')
FROM Orders

-- REPLACE(x, y, z) => "y" sucht in "x" den String um Ihn mit "z" zu ersetzen
SELECT REPLACE('Hallo Welt!', 'Welt!', 'und Willkommen!')

-- REPLICATE(x, y) => Setze "y" mal die "x" vor der Spalte "Phone"
SELECT REPLICATE('0', 3) + Phone FROM Customers

-- Reverse(Spaltenname) => Dreht die Zeichen um
SELECT CompanyName, REVERSE(CompanyName) FROM Customers


-- UPPER(Spaltenname) => alles in Großbuchstaben
SELECT CompanyName, UPPER(CompanyName) FROM Customers

-- Lower(Spaltenname) => alles in Kleinbuchstaben
SELECT CompanyName, Lower(CompanyName) FROM Customers

-- TRANSLATE(inputString, chars, replace)
-- => Gebe deinen Inputstring an, wähle die "chars" aus die im "inputString" ersetzt werden
-- sollen mit "replace"
SELECT TRANSLATE('2*[3+4]/{7-2}', '[]{}', '%$?!')
