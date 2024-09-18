USE Northwind

-- Subqueries / Unterabfragen / nested Queries

/*
	- Müssen eigenständig fehlerfrei ausfuerhbar sein!
	- Koennen prinzipiell überall in eine Abfrage eingebaut werden (Wenn es sinn macht)
	- Abfragen werden "von innen nach außen" der Reihe nach ausgeführt
*/

-- Zeige mir alle Orders, deren Freight Wert über dem Durchschnitt liegt
SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)