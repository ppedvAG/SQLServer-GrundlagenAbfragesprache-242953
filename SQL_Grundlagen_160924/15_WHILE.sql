USE Northwind

-- WHILE - leitet eine Schleifenanweisung ein

-- WHILE = Eine Schleife

DECLARE @Counter INT = 0

WHILE @Counter <= 5
BEGIN
SELECT 'Hallo'
SET @Counter += 1
END

-- Endlosschleife, aufpassen auf den Computer!
WHILE 1=1
BEGIN
SELECT 'Hallo'
END

SELECT * FROM PurchasingOrders

INSERT INTO PurchasingOrders
VALUES (GETDATE(), 10, NULL)
GO 20000


BEGIN TRAN
DECLARE @Zahl INT = 0
WHILE @Zahl <= 20000
BEGIN
INSERT INTO PurchasingOrders
VALUES (GETDATE(), 10, NULL)
SET @Zahl += 1
END
COMMIT


--BEGIN TRAN
DECLARE @Zahl1 INT = 0
WHILE @Zahl1 <= 20000
BEGIN
INSERT INTO PurchasingOrders
VALUES (GETDATE(), 10, NULL)
SET @Zahl1 += 1
END
--COMMIT
