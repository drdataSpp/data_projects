USE SuperStoreDB;

DROP TABLE IF EXISTS DimProduct_T; 

CREATE TABLE DimProduct_T(
	ProdID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ProductID VARCHAR(255) NOT NULL,
	ProductName VARCHAR(255) NOT NULL,
	SubCategoryID INT NOT NULL,
	CONSTRAINT FK_SubCategory FOREIGN KEY (SubCategoryID) REFERENCES DimSubCategory_T(SubCategoryID)
);