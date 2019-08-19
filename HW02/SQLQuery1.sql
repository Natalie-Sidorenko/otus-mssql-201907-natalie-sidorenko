/****** 1. Все товары, в которых в названии есть пометка urgent или название начинается с Animal  ******/
SELECT StockItemId, StockItemName, UnitPrice
FROM [WideWorldImporters].[Warehouse].[StockItems]
WHERE StockItemName like '%urgent%'OR StockItemName like 'Animal%';