-- Populating DimSegment_T Table
INSERT INTO [dbo].DimSegment_T ([Segment_Name])
SELECT DISTINCT([SEGMENT]) FROM [dbo].[Staging_SuperStoreSource_V];

--Checking data in DimSegment_V View
SELECT * FROM DimSegment_V;