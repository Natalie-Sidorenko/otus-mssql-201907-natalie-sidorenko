/****** 6. Vse id i imena klientov i ix kontaktnye telefony, kotorye pokupali tovar Chocolate frogs 250g  ******/
SELECT o.[CustomerID]
	  ,c.[CustomerName]
	  ,c.[PhoneNumber]
  FROM [WideWorldImporters].[Sales].[OrderLines] ol JOIN [WideWorldImporters].[Sales].[Orders] o
  ON ol.[OrderID]=o.[OrderID]
  JOIN [WideWorldImporters].[Sales].[Customers] c ON o.[CustomerID]=c.[CustomerID]
  WHERE [Description]='Chocolate frogs 250g'