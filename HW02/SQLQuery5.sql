/****** 5. 10 последних по дате продаж с именем клиента и именем сотрудника, который оформил заказ. ******/
SELECT TOP (10) o.[OrderID]
      ,c.[CustomerName]
      ,p.[FullName] AS Salesperson
      ,o.[OrderDate]
  FROM [WideWorldImporters].[Sales].[Orders] o JOIN [WideWorldImporters].[Sales].[Customers] c ON o.[CustomerID]=o.[CustomerID]
  JOIN [WideWorldImporters].[Application].[People] p ON o.[SalespersonPersonID]=p.[PersonID]
  ORDER BY o.[OrderDate] DESC