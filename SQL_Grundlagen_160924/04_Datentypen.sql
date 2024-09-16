/*
	Datentypen in SQL: 3 große Gruppen

	1. Charakter/String Datentypen:
	char(10) = 'Hallo     ' = 10 Byte Speicher => UTF-8
	nchar(10) = 'Hallo     ' = 20 Byte Speicher => UTF-16

	varchar(10) = 'Hallo'	= 5 Byte Speicher => UTF-16
	nvarchar(10) = 'Hallo'  = 10 Byte Speicher => UTF-16

	Legacy: text ---> VARCHAR(MAX) = bis zu 2GB
	varchar(8000) & nvarchar(4000) sind maximum


	2. Numerische Datentypen:
	tinyint = 8 Bit = 0 bis 255 (2, 4, 8, 16, 32, 64, 128, 256)-1
	smallint = 16 Bit = -32k bis 32k
	int = 32 Bit = -2,14Mrd bis 2,14Mrd
	bigint = 64 Bit = -9,2 Trillion bis -9,2 Trillion

	bit = 1 oder 0
	decimal(x, y) = x Ziffern gesamt, davon sind y Nachkommastellen
	decimal(10, 2) = 10 Ziffern insgesamt, davon sind 2 Nachkommastellen
	money = 9,2 Trillion
	smallmoney = 214k ca.


	3. Datum/Zeit Datentypen:
	time = hh:mm:ss.nnnnnnn
	date = YYYY-MM-DD
	datetime = date + time in MS = YYYY-MM-DD hh:mm:ss.mmm
	datetime2 = YYYY-MM-DD hh:mm:ss.nnnnnnn
	smalldatetime = YYYY-MM-DD hh:mm:ss

	Andere: 
	XML,JSON
	geometry
	geography
*/