-- USE Datenbankname  wechselt angesprochene Datenbank
-- Alternativ über die GUI (Drop-Down Menü)
USE Northwind

-- einzeilligen Kommentar

/*
	Mehrzeiligen Kommentar
	block
*/

-- Hotkey: STRG + K STRG + C (Kommentieren)
-- Hotkey: STRG + K STRG + U (Unkommentieren)

/*
	SELECT: wählt Spalten aus, die im Ergebnisfenster angezeigt werden sollen
*/

SELECT * FROM Customers -- * = wählen alles aus

SELECT CustomerID from Customers

-- "Custom" Werte und mathematischen Operatoren berechnen

SELECT 100

SELECT 'Hallo!'

SELECT 'Hallo', 100

SELECT 100+5, 7*8
-- Nur einzelne "Anweisungen" ausführen: Zeilen(n) markieren, F5 oder STRG+E

-----------------------------------------
SELECT CompanyName, Country FROM Customers

-- SQL ist NICHT Case-sensitive, wir brauchen kein Semikolon
SelEcT			cOuNtry,

			ComPanYName
						fRom CustOmers


-- Sortieren mit Order By
SELECT * FROM Customers
ORDER BY City

-- Absteigende Sortieren mit DESC
SELECT * FROM Customers
ORDER BY City DESC

-- Order by ist syntaktisch IMMER am Ende
-- DESC = descending = absteigend
-- ASC = ascending = aufsteigend (default Wert)

-- Mehrere Spalten mit ORDER BY 
SELECT City, CompanyName FROM Customers
ORDER BY City DESC, CompanyName ASC

-- TOP X gibt nur ersten X Zeilen aus
SELECT TOP 10 * FROM Customers

SELECT * FROM Customers

SELECT TOP 100 * FROM Customers

-- Geht auch Prozentual
-- TOP X PERCENT
SELECT TOP 10 PERCENT * FROM Customers

/*
	Wichtig!: Es gibt kein "Bottom X" oder "last X"
*/

-- Die 10 größten Frachtkosten haben
SELECT TOP 10 * FROM Orders
ORDER BY Freight DESC

-- Die 10 kleinsten Frachtkosten haben
SELECT TOP 10 * FROM Orders
ORDER BY Freight ASC

-------------------------
-- Duplikate "filtern" mit DISTINCT
-- Filtern alle Ergebnisse/DAtensätze deren Werte exakt gleich sind

SELECT DISTINCT Country FROM Customers

SELECT Country FROM Customers

SELECT DISTINCT City, Country FROM Customers

--------------------------
-- UNION führt mehrere Ergebnistabellen zusammen, vertikal
-- UNION macht automatisch ein DISTINCT mit
-- Datentypen müssen kompatibel sein und die Anzahl der Spalten muss gleich sein
SELECT * FROM Customers
UNION
SELECT * FROM Customers

-- Ohne Duplikatfilterung
SELECT * FROM Customers
UNION ALL
SELECT * FROM Customers

SELECT 100, 'Hallo'
UNION
SELECT 'Tschüss', 100, 100

-------------------
-- Spalten "umbennen" über Aliase bzw. "as"
SELECT 100 as '100', 'Hallo' as Begrüßung

-- Können tabellennamen vergeben
SELECT * FROM Customers as cus

