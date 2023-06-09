USE SuperStoreDB;

DROP TABLE IF EXISTS DimSegment_T;

CREATE TABLE DimSegment_T(
	SegmentID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Segment_Name VARCHAR(255) NOT NULL,
	RecInsertTime DATE DEFAULT GetDate() NOT NULL 
);