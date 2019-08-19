/****** 1. Vse tovary, v kotoryx v nazvanii est' pometka urgent ili nazvanie nachinaetsya s Animal  ******/
SELECT StockItemId, StockItemName, UnitPrice
FROM [WideWorldImporters].[Warehouse].[StockItems]
WHERE StockItemName like '%urgent%'OR StockItemName like 'Animal%';