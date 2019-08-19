/****** 2. Поставщиков, у которых не было сделано ни одного заказа  ******/
SELECT s.[SupplierID]
      ,s.[SupplierName]
      ,s.[SupplierCategoryID]
  FROM [WideWorldImporters].[Purchasing].[Suppliers] s LEFT JOIN [WideWorldImporters].[Purchasing].[SupplierTransactions] t
  ON s.[SupplierID]=t.[SupplierID]
  WHERE t.[SupplierTransactionID] IS NULL