/****** 6. Vse id i imena klientov i ix kontaktnye telefony, kotorye pokupali tovar Chocolate frogs 250g  ******/
SELECT o.[CustomerID]
	  ,c.[CustomerName]
	  ,c.[PhoneNumber]
  FROM [WideWorldImporters].[Sales].[OrderLines] ol
  JOIN [WideWorldImporters].[Sales].[Orders] o ON ol.[OrderID]=o.[OrderID]
  JOIN [WideWorldImporters].[Sales].[Customers] c ON o.[CustomerID]=c.[CustomerID]
  WHERE [Description]='Chocolate frogs 250g';

  /****** Variant via [Warehouse].[StockItems] and [Warehouse].[StockItemTransactions]  ******/
  SELECT st.[CustomerID]
	  ,c.[CustomerName]
	  ,c.[PhoneNumber]
  FROM [WideWorldImporters].[Warehouse].[StockItems] si
  JOIN [WideWorldImporters].[Warehouse].[StockItemTransactions] st ON si.[StockItemID]=st.[StockItemID]
  JOIN [WideWorldImporters].[Sales].[Customers] c ON st.[CustomerID]=c.[CustomerID]
  WHERE si.[StockItemName]='Chocolate frogs 250g' AND st.[TransactionTypeID]=10;