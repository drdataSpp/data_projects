USE SuperStoreDB;

-- Which Region is the Most Profitable?

DROP VIEW IF EXISTS ProfitByRegion_V;

CREATE VIEW ProfitByRegion_V AS
SELECT
	RGN.Region_Name,
	SUM(FCT.Profit) AS TOTAL_PROFIT
FROM [dbo].[FactSales_V] AS FCT

INNER JOIN [dbo].[DimState_V] AS STAT ON
	STAT.StateID = FCT.StateID
	
INNER JOIN [dbo].[DimCountry_V] AS COUNTRY ON
	COUNTRY.CountryID = STAT.CountryID

INNER JOIN [dbo].[DimRegion_V] AS RGN ON
	RGN.RegionID = COUNTRY.CountryID

GROUP BY RGN.Region_Name;

-- SELECTING FROM THE VIEW
SELECT * FROM ProfitByRegion_V
ORDER BY TOTAL_PROFIT DESC; -- 'AFRICA' MADE THE HIGHEST PROFIT & WEST MADE THE LEAST PROFIT. 
