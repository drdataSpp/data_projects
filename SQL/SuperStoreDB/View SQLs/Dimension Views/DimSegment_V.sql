USE SuperStoreDB;

DROP VIEW IF EXISTS DimSegment_V;

CREATE VIEW DimSegment_V
AS
SELECT	
	T.SegmentID	AS OrderPriorityID,
	T.Segment_Name	AS Order_Priority
FROM DimSegment_T AS T
;