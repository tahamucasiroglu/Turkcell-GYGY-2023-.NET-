-- Testler



--Stocklar� getir
SELECT * FROM Stocks

-- Mastera sormadan direk getirtme
SELECT Id, Waste, Stock FROM Stocks

-- Stokta olan at�klar� getir (�nce where �al���r)
SELECT Id, Waste, Stock From Stocks WHERE Stock > 0

-- sto�u olanlar� K���kten b�y��e s�rala
SELECT Id, Waste, Stock From Stocks WHERE Stock > 0 ORDER BY Stock ASC

-- At�k al�mlar�nda at�k kilogram� yani quantity si 950 den b�y�k olanlar� getir ve k���kten b�y��e s�rala
SELECT 
	Id, Employee, Collector, Quantity, Waste, Price, Amount, [Date] 
FROM Entries
WHERE Quantity > 990
ORDER BY Quantity ASC

-- At�k al�mlar�nda at�k kilogram� yani quantity si 950 den b�y�k olanlar� getir ve k���kten b�y��e s�rala ayn� quantityleri de amount yani �denen fiyata g�re b�y�kten k����e
SELECT 
	Id, Employee, Collector, Quantity, Waste, Price, Amount, [Date] 
FROM Entries
WHERE Quantity > 990
ORDER BY Quantity ASC, Amount DESC

-- Toplay�c�lardan ad� a ile ba�layanlar� getir
SELECT 
	Id, [Name], Surname, Phone
FROM Collectors
WHERE [Name] LIKE 'A%'

-- Toplay�c�lardan telefon numaras� 0532 ile ba�layanlar� getir
SELECT 
	Id, [Name], Surname, Phone
FROM Collectors
WHERE Phone LIKE '0532%'

-- At�k giri�lerinin yan�na ek kolonla ka� sene �nce ger�ekle�ti�ini ekle
SELECT 
	Id, Employee, Collector, Quantity, Waste, Price, Amount, [Date], YEAR(GETDATE()) - YEAR([Date]) as YearAgo
FROM Entries

-- iki tarih aras� giri�leri al
SELECT 
	Id, Employee, Collector, Quantity, Waste, Price, Amount, [Date], YEAR(GETDATE()) - YEAR([Date]) as YearAgo
FROM Entries
WHERE Date BETWEEN '2015-07-04' AND '2016-07-04'

-- sat�n al�nan at�k maddelerinin idlerini getir belirli tarih aras�nda
SELECT 
	DISTINCT Waste
FROM Entries
WHERE Date BETWEEN '2015-07-04' AND '2015-07-05'

-- bir topla�c�ya getirdi�i at�klar i�in bu zmaan kadar ne kadar �dendi
SELECT 
	SUM(Amount) as [1998 nolu topla�c�n�n ald��� toplam para]
FROM Entries
WHERE Collector = 1998

-- ka� tane �r�n getirmi� toplay�c�m var
SELECT
	COUNT(*) as [Toplam Toplay�c� Say�s�] 
FROM Collectors
SELECT
	COUNT(DISTINCT Collector) as [Etkle�imde bulunulan toplay�c� say�s�] 
FROM Entries

--En fazla �deme yap�lan sat�n al�m
SELECT
	MAX(Amount) as [Max �deme] 
FROM Entries

--En az sat�n al�nan at�k kilogram�
SELECT
	MIN(Quantity) as [Min Al�m] 
FROM Entries

-- Toplay�c�lar� ve etkile�im say�s�n� g�ster
SELECT 
	Collector, COUNT(Amount) 
FROM Entries 
GROUP BY Collector
ORDER BY Collector

-- Toplay�c�lar� ve etkile�imini ayr�ca etkile�imi 600 ve �st� olanlar� g�ster
SELECT 
	Collector, COUNT(Amount) as [�ok �al��anlar] 
FROM Entries 
GROUP BY Collector
HAVING COUNT(Amount) >= 600
ORDER BY Collector

-- Hangi at��a ne kadar �dendi
SELECT 
	DISTINCT Waste, ROUND(SUM(Amount), 2)
FROM Entries
GROUP BY Waste

-- Hangi at��a ne kadar �dendi�inin yan�na TL ekle BOZUK YAZIYOR ��ZEMED�M U�RA�MADIMDA
SELECT 
	DISTINCT Waste, CAST(ROUND(SUM(Amount),0) AS NVARCHAR) + ' TL'
FROM Entries
GROUP BY Waste

-- ilk 20 sat�n al�m� getir
SELECT TOP 20
	Id, Employee, Collector, Quantity, Waste, Price, Amount, [Date], YEAR(GETDATE()) - YEAR([Date]) as YearAgo
FROM Entries

-- Son 20 Sat�n al�mdaki bilgileri getir
SELECT TOP 20
	Id, Employee, Collector, Quantity, Waste, Price, Amount, [Date]
FROM Entries


-- son 20 sat�n al�m�n bilgilerini ki�ilerin ad soyadlar�n� ve at�k ad� ile getir
SELECT TOP 20
    e.Id, 
	Employee, 
	CONCAT(emp.Name, ' ', emp.Surname) AS EmployeeName, 
	e.Collector, 
	CONCAT(col.Name, ' ', col.Surname) AS CollectorName, 
	e.Quantity, 
	e.Waste,
	was.Name AS WasteName, 
	e.Price, 
	e.Amount, 
	e.[Date],
	YEAR(GETDATE()) - YEAR([Date]) as YearAgo
FROM Entries e
INNER JOIN Employees emp ON emp.Id = e.Employee
INNER JOIN Collectors col ON col.Id = e.Collector
INNER JOIN Wastes was ON was.Id = e.Waste
ORDER BY [Date] DESC


-- son 20 sat�n al�m�n bilgilerini ki�ilerin ad soyadlar�n� at�k ad�n� ve �creti at�k id ile sorgulayarak g�ncel getir
SELECT TOP 20
    e.Id, 
	Employee, 
	CONCAT(emp.Name, ' ', emp.Surname) AS EmployeeName, 
	e.Collector, 
	CONCAT(col.Name, ' ', col.Surname) AS CollectorName, 
	e.Quantity, 
	e.Waste,
	was.Name AS WasteName, 
	e.Price,
	bp.Price as PriceValue,
	e.Amount, 
	e.[Date],
	YEAR(GETDATE()) - YEAR([Date]) as YearAgo
FROM Entries e
INNER JOIN Employees emp ON emp.Id = e.Employee --id e�itleme
INNER JOIN Collectors col ON col.Id = e.Collector
INNER JOIN Wastes was ON was.Id = e.Waste
INNER JOIN BuyPrices bp ON e.Waste = bp.Waste  -- ba�ka id ile e�leyip oradan de�er �ekme
ORDER BY [Date] DESC


-- Ba�tan bu zamana toplam kar� hesapla
SELECT 
	SUM(e.Amount) AS Odenen,
	SUM(o.Amount) AS Al�nan,
	SUM(o.Amount) - SUM(e.Amount) AS ToplamKar
FROM Entries AS e, Outputs AS o

-- son bir seneki toplam kar� hesapla
SELECT 
	SUM(e.Amount) AS Odenen,
	SUM(o.Amount) AS Al�nan,
	SUM(o.Amount) - SUM(e.Amount) AS ToplamKar
FROM Entries AS e, Outputs AS o
WHERE e.Date >= DATEADD(year, -1, GETDATE())
AND o.Date >= DATEADD(year, -1, GETDATE())


