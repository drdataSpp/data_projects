-- Populating DimShipMode_T Table
INSERT INTO [dbo].[DimShipMode_T] ([Ship_Mode])
SELECT DISTINCT([SHIP_MODE]) FROM [dbo].[Staging_SuperStoreSource_V];

--Checking data in DimShipMode_V View
SELECT * FROM DimShipMode_V;