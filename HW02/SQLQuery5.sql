/****** 5. 10 poslednix po date prodazh s imenem klienta i imenem sotrudnika, kotoryj oformil zakaz. ******/
SELECT TOP (10) o.[OrderID]
      ,c.[CustomerName]
      ,p.[FullName] AS Salesperson
      ,o.[OrderDate]
  FROM [WideWorldImporters].[Sales].[Customers] c 
  JOIN [WideWorldImporters].[Sales].[Orders] o ON o.[CustomerID]=c.[CustomerID]
  JOIN [WideWorldImporters].[Application].[People] p ON o.[SalespersonPersonID]=p.[PersonID]
  ORDER BY o.[OrderDate] DESC