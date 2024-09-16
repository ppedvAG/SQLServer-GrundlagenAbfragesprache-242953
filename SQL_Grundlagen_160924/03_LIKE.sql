USE Northwind
-- LIKE: Für ungenaue Filterung/Suche können wir LIKE verwenden
-- (statt Vergleichsoperator)

-- 1. Alle ContactNames die als Title "Owner" haben
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle = 'Owner'

-- Wildcard
-- "%"-Zeichen: Beliebige Symbole, beliebig viele davon
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Owner%'

SELECT DISTINCT ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Manager%'

-- "_"-Zeichen: Ein beliebiges Symbol
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE '_l%'

-- "[]"-Zeichen: Alles was da drinnen ist, ist ein gültiges Symbol
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[012345]%'

-- "[a-z]" oder gegenteil mit ^ [^a-z]
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[0-5]%'

SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[^0-5]%'

SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[1-5 a-g]%'

-- Sonderfälle: %, ''
SELECT * FROM Customers
WHERE CompanyName LIKE '%['']%'

SELECT * FROM Customers
WHERE CompanyName LIKE '%[%]%'

SELECT * FROM Customers
WHERE ContactName = 'FrÃ©dÃ©rique Citeaux'