USE Northwind

-- Subqueries / Unterabfragen / nested Queries

/*
	- M�ssen eigenst�ndig fehlerfrei ausfuerhbar sein!
	- Koennen prinzipiell �berall in eine Abfrage eingebaut werden (Wenn es sinn macht)
	- Abfragen werden "von innen nach au�en" der Reihe nach ausgef�hrt
*/

-- Zeige mir alle Orders, deren Freight Wert �ber dem Durchschnitt liegt
SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)