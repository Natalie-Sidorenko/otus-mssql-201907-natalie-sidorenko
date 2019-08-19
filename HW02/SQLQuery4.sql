/****** 4. Заказы поставщикам, которые были исполнены за 2014й год с доставкой Road Freight или Post, 
добавьте название поставщика, имя контактного лица принимавшего заказ  ******/
SELECT po.[PurchaseOrderID]
      ,su.[SupplierName]
      ,po.[OrderDate]
      ,po.[DeliveryMethodID]
	  ,dm.[DeliveryMethodName]
      ,pe.[FullName] AS ContactPerson --это лицо, делавшее поставщику заказ (сотрудник WWI), - но только оно указано у конкретного заказа
	  --,pe1.[FullName] AS PrimaryContactPerson --а принимало заказ, очевидно, либо PrimaryContactPerson со стороны поставщика
	  --,pe2.[FullName] AS AlternateContactPerson --либо AlternateContactPerson поставщика принимало заказ
	  ,po.[ExpectedDeliveryDate]
	  ,po.[IsOrderFinalized]
  FROM [WideWorldImporters].[Purchasing].[PurchaseOrders] po JOIN [WideWorldImporters].[Application].[DeliveryMethods] dm
  ON po.[DeliveryMethodID]=dm.[DeliveryMethodID]
  JOIN [WideWorldImporters].[Application].[People] pe ON po.[ContactPersonID]=pe.[PersonID]
  JOIN [WideWorldImporters].[Purchasing].[Suppliers] su ON po.[SupplierID]=su.[SupplierID]
  --JOIN [WideWorldImporters].[Application].[People] pe1 ON su.[PrimaryContactPersonID]=pe1.[PersonID]
  --JOIN [WideWorldImporters].[Application].[People] pe2 ON su.[AlternateContactPersonID]=pe2.[PersonID]
  WHERE dm.[DeliveryMethodName] IN ('Road Freight', 'Post') AND YEAR (po.[OrderDate]) = 2014 AND po.[IsOrderFinalized]=1 --только исполненные