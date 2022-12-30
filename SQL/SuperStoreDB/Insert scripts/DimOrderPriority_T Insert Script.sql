-- Populating DimOrderPriority_T Table
INSERT INTO [dbo].[DimOrderPriority_T] ([Order_Priority])
SELECT DISTINCT([ORDER_PRIORITY]) FROM [dbo].[Staging_SuperStoreSource_V];

--Checking data in DimOrderPriority_V View
SELECT * FROM DimOrderPriority_V;