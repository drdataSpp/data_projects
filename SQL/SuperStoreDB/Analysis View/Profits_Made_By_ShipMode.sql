USE SuperStoreDB;

DROP VIEW IF EXISTS ProfitsByShipMode_V;

CREATE VIEW ProfitsByShipMode_V AS
SELECT
	SHP.Ship_Mode, 
	ROUND(SUM(FCT.[Profit]), 2) AS TOTAL_PROFIT
FROM [dbo].[FactSales_V] AS FCT

INNER JOIN [dbo].[DimShipMode_V] AS SHP ON
	SHP.ShipModeID = FCT.ShipModeID

GROUP BY SHP.Ship_Mode;

-- SELECTING FROM THE VIEW
SELECT * FROM ProfitsByShipMode_V
ORDER BY TOTAL_PROFIT DESC; -- 'Standard Class' HAS MADE THE HIGHEST PROFIT & 'Same Day' HAS MADE THE LEAST PROFIT. 