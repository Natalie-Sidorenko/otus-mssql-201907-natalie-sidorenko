/****** 4. ������ �����������, ������� ���� ��������� �� 2014� ��� � ��������� Road Freight ��� Post, 
�������� �������� ����������, ��� ����������� ���� ������������ �����  ******/
SELECT po.[PurchaseOrderID]
      ,su.[SupplierName]
      ,po.[OrderDate]
      ,po.[DeliveryMethodID]
	  ,dm.[DeliveryMethodName]
      ,pe.[FullName] AS ContactPerson --��� ����, �������� ���������� ����� (��������� WWI), - �� ������ ��� ������� � ����������� ������
	  --,pe1.[FullName] AS PrimaryContactPerson --� ��������� �����, ��������, ���� PrimaryContactPerson �� ������� ����������
	  --,pe2.[FullName] AS AlternateContactPerson --���� AlternateContactPerson ���������� ��������� �����
	  ,po.[ExpectedDeliveryDate]
	  ,po.[IsOrderFinalized]
  FROM [WideWorldImporters].[Purchasing].[PurchaseOrders] po JOIN [WideWorldImporters].[Application].[DeliveryMethods] dm
  ON po.[DeliveryMethodID]=dm.[DeliveryMethodID]
  JOIN [WideWorldImporters].[Application].[People] pe ON po.[ContactPersonID]=pe.[PersonID]
  JOIN [WideWorldImporters].[Purchasing].[Suppliers] su ON po.[SupplierID]=su.[SupplierID]
  --JOIN [WideWorldImporters].[Application].[People] pe1 ON su.[PrimaryContactPersonID]=pe1.[PersonID]
  --JOIN [WideWorldImporters].[Application].[People] pe2 ON su.[AlternateContactPersonID]=pe2.[PersonID]
  WHERE dm.[DeliveryMethodName] IN ('Road Freight', 'Post') AND YEAR (po.[OrderDate]) = 2014 AND po.[IsOrderFinalized]=1 --������ �����������