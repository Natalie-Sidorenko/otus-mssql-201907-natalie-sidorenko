/****** 4. Zakazy postavshchikam, kotorye byli ispolneny za 2014j god s dostavkoj Road Freight ili Post, 
dobav'te nazvanie postavshchika, imya kontaktnogo lica prinimavshego zakaz  ******/
SELECT po.[PurchaseOrderID]
      ,su.[SupplierName]
      ,po.[OrderDate]
      ,po.[DeliveryMethodID]
	  ,dm.[DeliveryMethodName]
      ,pe.[FullName] AS ContactPerson --e'to lico, delavshee postavshchiku zakaz (sotrudnik WWI), - no tol'ko ono ukazano u konkretnogo zakaza
	  --,pe1.[FullName] AS PrimaryContactPerson --a prinimalo zakaz, ochevidno, libo PrimaryContactPerson so storony postavshchika
	  --,pe2.[FullName] AS AlternateContactPerson --libo AlternateContactPerson postavshchika prinimalo zakaz
	  ,po.[ExpectedDeliveryDate]
	  ,po.[IsOrderFinalized]
  FROM [WideWorldImporters].[Purchasing].[PurchaseOrders] po JOIN [WideWorldImporters].[Application].[DeliveryMethods] dm
  ON po.[DeliveryMethodID]=dm.[DeliveryMethodID]
  JOIN [WideWorldImporters].[Application].[People] pe ON po.[ContactPersonID]=pe.[PersonID]
  JOIN [WideWorldImporters].[Purchasing].[Suppliers] su ON po.[SupplierID]=su.[SupplierID]
  --JOIN [WideWorldImporters].[Application].[People] pe1 ON su.[PrimaryContactPersonID]=pe1.[PersonID]
  --JOIN [WideWorldImporters].[Application].[People] pe2 ON su.[AlternateContactPersonID]=pe2.[PersonID]
  WHERE dm.[DeliveryMethodName] IN ('Road Freight', 'Post') AND YEAR (po.[OrderDate]) = 2014 AND po.[IsOrderFinalized]=1 --tol'ko ispolnennye