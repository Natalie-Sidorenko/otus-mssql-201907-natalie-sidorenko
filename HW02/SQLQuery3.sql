/****** 3. Prodazhi s nazvaniem mesyaca, v kotorom byla prodazha, nomerom kvartala, k kotoromu otnositsya prodazha, 
vklyuchite takzhe k kakoj treti goda otnositsya data - kazhdaya tret' po 4 mesyaca,
data zabora zakaza dolzhna byt' zadana, s cenoj tovara bolee 100$ libo kolichestvo edinic tovara bolee 20.
Soritrovka dolzhna byt' po nomeru kvartala, treti goda, date prodazhi. ******/
SELECT l.[OrderLineID]
      ,l.[OrderID]
	  ,o.[OrderDate]
	  ,DATENAME(MONTH,o.[OrderDate]) AS [Month]
	  ,DATENAME(q, o.[OrderDate]) AS [Quarter]
	  ,CASE WHEN MONTH(o.[OrderDate]) IN (1,2,3,4) THEN 1
	  WHEN MONTH(o.[OrderDate]) IN (5,6,7,8) THEN 2
	  WHEN MONTH(o.[OrderDate]) IN (9,10,11,12) THEN 3 END AS [ThirdOfYear]
	  --,YEAR(o.[OrderDate]) AS [Year]
      ,l.[Quantity]
      ,l.[UnitPrice]
      ,l.[PickedQuantity]
      ,l.[PickingCompletedWhen]
	  ,l.[StockItemID]
      ,l.[Description]
  FROM [WideWorldImporters].[Sales].[OrderLines] l JOIN [WideWorldImporters].[Sales].[Orders] o
  ON l.[OrderID]=o.[OrderID]
  WHERE NOT l.[PickingCompletedWhen] IS NULL AND (l.[UnitPrice]>100 OR[Quantity]>20)
  ORDER BY --[Year], 
  [Quarter], [ThirdOfYear], o.[OrderDate] --YA by dobavila syuda eshchyo sortirovku snachala po godu, no pryamo ne trebuetsya...

  /****** Dobav'te variant e'togo zaprosa s postranichnoj vyborkoj propustiv pervuyu 1000 i otobraziv sleduyushchie 100 zapisej. ******/
  SELECT l.[OrderLineID]
      ,l.[OrderID]
	  ,o.[OrderDate]
	  ,DATENAME(MONTH,o.[OrderDate]) AS [Month]
	  ,DATENAME(q, o.[OrderDate]) AS [Quarter]
	  ,CASE WHEN MONTH(o.[OrderDate]) IN (1,2,3,4) THEN 1
	  WHEN MONTH(o.[OrderDate]) IN (5,6,7,8) THEN 2
	  WHEN MONTH(o.[OrderDate]) IN (9,10,11,12) THEN 3 END AS [ThirdOfYear]
	  --,YEAR(o.[OrderDate]) AS [Year]
      ,l.[Quantity]
      ,l.[UnitPrice]
      ,l.[PickedQuantity]
      ,l.[PickingCompletedWhen]
	  ,l.[StockItemID]
      ,l.[Description]
  FROM [WideWorldImporters].[Sales].[OrderLines] l JOIN [WideWorldImporters].[Sales].[Orders] o
  ON l.[OrderID]=o.[OrderID]
  WHERE NOT l.[PickingCompletedWhen] IS NULL AND (l.[UnitPrice]>100 OR[Quantity]>20)
  ORDER BY --[Year], 
  [Quarter], [ThirdOfYear], o.[OrderDate]
  OFFSET 1000 ROWS FETCH FIRST 100 ROWS ONLY