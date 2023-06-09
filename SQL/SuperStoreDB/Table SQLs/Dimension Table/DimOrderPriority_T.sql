USE SuperStoreDB;

DROP TABLE IF EXISTS DimOrderPriority_T;

CREATE TABLE DimOrderPriority_T(
	OrderPriorityID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Order_Priority VARCHAR(255) NOT NULL,
	RecInsertTime DATE DEFAULT GetDate() NOT NULL
);