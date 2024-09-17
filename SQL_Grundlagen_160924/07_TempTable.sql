USE Northwind

-- Temporäre Tabelle / Temp Tables / #Tables

/*
	SELECT INTO #TableName => Ergebnisse in einer Temp Table gespeicherts
	-- existiert nur innerhalb unserer Session (Skriptfenster/Query)
	-- werden in SystemDB -> tempDB angelegt
	-- Ergebnisse werden nur einmal generiert => TempTables sind sehr schnell aber nicht aktuell
	-- lokale Temps = #
	-- globale Temps = ##

*/

-- Erstellen
SELECT * INTO ##TempTable
FROM Customers
WHERE Country = 'Germany'

-- Temp Table aufrufen
SELECT * FROM ##TempTable

UPDATE ##TempTable
SET Country = 'France'

SELECT * FROM Customers
WHERE Country = 'Germany'

-- manuell löschen
DROP TABLE ##TempTable