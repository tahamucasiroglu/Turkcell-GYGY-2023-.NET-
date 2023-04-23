-- Testler



--Stocklarý getir
SELECT * FROM Stocks

-- Mastera sormadan direk getirtme
SELECT Id, Waste, Stock FROM Stocks

-- Stokta olan atýklarý getir (önce where çalýþýr)
SELECT Id, Waste, Stock From Stocks WHERE Stock > 0

-- stoðu olanlarý Küçükten büyüðe sýrala
SELECT Id, Waste, Stock From Stocks WHERE Stock > 0 ORDER BY Stock ASC

-- Atýk alýmlarýnda atýk kilogramý yani quantity si 950 den büyük olanlarý getir ve küçükten büyüðe sýrala
SELECT 
	Id, Employee, Collector, Quantity, Waste, Price, Amount, [Date] 
FROM Entries
WHERE Quantity > 990
ORDER BY Quantity ASC

-- Atýk alýmlarýnda atýk kilogramý yani quantity si 950 den büyük olanlarý getir ve küçükten büyüðe sýrala ayný quantityleri de amount yani ödenen fiyata göre büyükten küçüðe
SELECT 
	Id, Employee, Collector, Quantity, Waste, Price, Amount, [Date] 
FROM Entries
WHERE Quantity > 990
ORDER BY Quantity ASC, Amount DESC

-- Toplayýcýlardan adý a ile baþlayanlarý getir
SELECT 
	Id, [Name], Surname, Phone
FROM Collectors
WHERE [Name] LIKE 'A%'

-- Toplayýcýlardan telefon numarasý 0532 ile baþlayanlarý getir
SELECT 
	Id, [Name], Surname, Phone
FROM Collectors
WHERE Phone LIKE '0532%'

-- Atýk giriþlerinin yanýna ek kolonla kaç sene önce gerçekleþtiðini ekle
SELECT 
	Id, Employee, Collector, Quantity, Waste, Price, Amount, [Date], YEAR(GETDATE()) - YEAR([Date]) as YearAgo
FROM Entries

-- iki tarih arasý giriþleri al
SELECT 
	Id, Employee, Collector, Quantity, Waste, Price, Amount, [Date], YEAR(GETDATE()) - YEAR([Date]) as YearAgo
FROM Entries
WHERE Date BETWEEN '2015-07-04' AND '2016-07-04'

-- satýn alýnan atýk maddelerinin idlerini getir belirli tarih arasýnda
SELECT 
	DISTINCT Waste
FROM Entries
WHERE Date BETWEEN '2015-07-04' AND '2015-07-05'

-- bir toplaýcýya getirdiði atýklar için bu zmaan kadar ne kadar ödendi
SELECT 
	SUM(Amount) as [1998 nolu toplaýcýnýn aldýðý toplam para]
FROM Entries
WHERE Collector = 1998

-- kaç tane ürün getirmiþ toplayýcým var
SELECT
	COUNT(*) as [Toplam Toplayýcý Sayýsý] 
FROM Collectors
SELECT
	COUNT(DISTINCT Collector) as [Etkleþimde bulunulan toplayýcý sayýsý] 
FROM Entries

--En fazla ödeme yapýlan satýn alým
SELECT
	MAX(Amount) as [Max Ödeme] 
FROM Entries

--En az satýn alýnan atýk kilogramý
SELECT
	MIN(Quantity) as [Min Alým] 
FROM Entries

-- Toplayýcýlarý ve etkileþim sayýsýný göster
SELECT 
	Collector, COUNT(Amount) 
FROM Entries 
GROUP BY Collector
ORDER BY Collector

-- Toplayýcýlarý ve etkileþimini ayrýca etkileþimi 600 ve üstü olanlarý göster
SELECT 
	Collector, COUNT(Amount) as [Çok Çalýþanlar] 
FROM Entries 
GROUP BY Collector
HAVING COUNT(Amount) >= 600
ORDER BY Collector

-- Hangi atýða ne kadar ödendi
SELECT 
	DISTINCT Waste, ROUND(SUM(Amount), 2)
FROM Entries
GROUP BY Waste

-- Hangi atýða ne kadar ödendiðinin yanýna TL ekle BOZUK YAZIYOR ÇÖZEMEDÝM UÐRAÞMADIMDA
SELECT 
	DISTINCT Waste, CAST(ROUND(SUM(Amount),0) AS NVARCHAR) + ' TL'
FROM Entries
GROUP BY Waste

-- ilk 20 satýn alýmý getir
SELECT TOP 20
	Id, Employee, Collector, Quantity, Waste, Price, Amount, [Date], YEAR(GETDATE()) - YEAR([Date]) as YearAgo
FROM Entries

-- Son 20 Satýn alýmdaki bilgileri getir
SELECT TOP 20
	Id, Employee, Collector, Quantity, Waste, Price, Amount, [Date]
FROM Entries


-- son 20 satýn alýmýn bilgilerini kiþilerin ad soyadlarýný ve atýk adý ile getir
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


-- son 20 satýn alýmýn bilgilerini kiþilerin ad soyadlarýný atýk adýný ve ücreti atýk id ile sorgulayarak güncel getir
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
INNER JOIN Employees emp ON emp.Id = e.Employee --id eþitleme
INNER JOIN Collectors col ON col.Id = e.Collector
INNER JOIN Wastes was ON was.Id = e.Waste
INNER JOIN BuyPrices bp ON e.Waste = bp.Waste  -- baþka id ile eþleyip oradan deðer çekme
ORDER BY [Date] DESC


-- Baþtan bu zamana toplam karý hesapla
SELECT 
	SUM(e.Amount) AS Odenen,
	SUM(o.Amount) AS Alýnan,
	SUM(o.Amount) - SUM(e.Amount) AS ToplamKar
FROM Entries AS e, Outputs AS o

-- son bir seneki toplam karý hesapla
SELECT 
	SUM(e.Amount) AS Odenen,
	SUM(o.Amount) AS Alýnan,
	SUM(o.Amount) - SUM(e.Amount) AS ToplamKar
FROM Entries AS e, Outputs AS o
WHERE e.Date >= DATEADD(year, -1, GETDATE())
AND o.Date >= DATEADD(year, -1, GETDATE())


