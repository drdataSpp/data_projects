# Super Store Data Warehouse

## Tools Used
- Microsoft SQL Server Integration Services (SSIS) for *ETL tasks*
- Microsoft SQL Server Management Studio (SSMS) for *Data Warehousing tasks*

### ETL Evidence
<img src="https://github.com/drdataSpp/data_projects/blob/master/SQL/SuperStoreDB/Screenshots/01_ETL_Success.png" alt="ETL" title="ETL">

### Source Dataset Link
Kaggle SuperStore Dataset: [Link](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)

#### Columns in the source dataset
- Order ID => Unique Order ID for each Customer.
- Order Date => Order Date of the product.
- Ship Date => Shipping Date of the Product.
- Ship Mode=> Shipping Mode specified by the Customer.
- Customer ID => Unique ID to identify each Customer.
- Customer Name => Name of the Customer.
- Segment => The segment where the Customer belongs.
- Country => Country of residence of the Customer.
- City => City of residence of of the Customer.
- State => State of residence of the Customer.
- Postal Code => Postal Code of every Customer.
- Region => Region where the Customer belong.
- Product ID => Unique ID of the Product.
- Category => Category of the product ordered.
- Sub-Category => Sub-Category of the product ordered.
- Product Name => Name of the Product
- Sales => Sales of the Product.
- Quantity => Quantity of the Product.
- Discount => Discount provided.
- Profit => Profit/Loss incurred.

### Facts and Dimension Data Model
<img src="https://github.com/drdataSpp/data_projects/blob/master/SQL/SuperStoreDB/Screenshots/SuperStore_DataModel.png" alt="Data Model" title="Data Model">

### Tier 3 - Analysis Views
- [Profits made by Category](https://github.com/drdataSpp/data_projects/blob/master/SQL/SuperStoreDB/Analysis%20View/Profits_Made_By_Category.sql)
- [Profits made by Sub Category](https://github.com/drdataSpp/data_projects/blob/master/SQL/SuperStoreDB/Analysis%20View/Profits_Made_By_SubCategory.sql)
- [Profits made by Products](https://github.com/drdataSpp/data_projects/blob/master/SQL/SuperStoreDB/Analysis%20View/Profits_Made_By_Products.sql)
- [Profits made by Markets](https://github.com/drdataSpp/data_projects/blob/master/SQL/SuperStoreDB/Analysis%20View/Profits_Made_By_Markets.sql)
- [Profits made by Shipping Mode](https://github.com/drdataSpp/data_projects/blob/master/SQL/SuperStoreDB/Analysis%20View/Profits_Made_By_ShipMode.sql)
- Which Category is Best Selling and Most Profitable? [SQL Query](https://github.com/drdataSpp/data_projects/blob/master/SQL/SuperStoreDB/Analysis%20View/ProfSalesQuantByCategory_V.sql)
- What are the Best Selling and Most Profitable Sub-Category? [SQL Query](https://github.com/drdataSpp/data_projects/blob/master/SQL/SuperStoreDB/Analysis%20View/ProfSalesQuantBySubCategory_V.sql)
- Which Customer Segment is Most Profitable? [SQL Query](https://github.com/drdataSpp/data_projects/blob/master/SQL/SuperStoreDB/Analysis%20View/ProfitBySegment_V.sql)
- Which is the Preferred Ship Mode? [SQL Query](https://github.com/drdataSpp/data_projects/blob/master/SQL/SuperStoreDB/Analysis%20View/PreferredShipmentMode_V.sql)
- Which Region is the Most Profitable? [SQL Query](https://github.com/drdataSpp/data_projects/blob/master/SQL/SuperStoreDB/Analysis%20View/ProfitByRegion_V.sql)
