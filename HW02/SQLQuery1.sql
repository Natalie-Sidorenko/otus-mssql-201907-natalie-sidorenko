/****** 1. ��� ������, � ������� � �������� ���� ������� urgent ��� �������� ���������� � Animal  ******/
SELECT StockItemId, StockItemName, UnitPrice
FROM [WideWorldImporters].[Warehouse].[StockItems]
WHERE StockItemName like '%urgent%'OR StockItemName like 'Animal%';