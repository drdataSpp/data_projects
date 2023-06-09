USE SuperStoreDB;

DROP TABLE IF EXISTS DimRegion_T; 

CREATE TABLE DimRegion_T(
	RegionID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Region_Name VARCHAR(255) NOT NULL,
	RecInsertTime DATE DEFAULT GetDate() NOT NULL 
);