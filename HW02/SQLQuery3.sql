/****** 3. Продажи с названием месяца, в котором была продажа, номером квартала, к которому относится продажа, 
включите также к какой трети года относится дата - каждая треть по 4 месяца,
дата забора заказа должна быть задана, с ценой товара более 100$ либо количество единиц товара более 20.
Соритровка должна быть по номеру квартала, трети года, дате продажи. ******/
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
  [Quarter], [ThirdOfYear], o.[OrderDate] --Я бы добавила сюда ещё сортировку сначала по году, но прямо не требуется...

  /****** Добавьте вариант этого запроса с постраничной выборкой пропустив первую 1000 и отобразив следующие 100 записей. ******/
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