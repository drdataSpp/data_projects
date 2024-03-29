USE SuperStoreDB;

DROP TABLE IF EXISTS DimSubCategory_T; 

CREATE TABLE DimSubCategory_T(
	SubCategoryID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CategoryID INT NOT NULL,
	Sub_Category_Name VARCHAR(255) NOT NULL
	CONSTRAINT FK_Category FOREIGN KEY (CategoryID) REFERENCES DimCategory_T(CategoryID)
);