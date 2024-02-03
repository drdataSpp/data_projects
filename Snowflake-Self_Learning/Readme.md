# Snowflake Self-Learning Documentation

A free account was created using the "Enterprise" edition.
Enterprise edition supports multi-cluster virtual warehouses and up to 90 days of time travel.

Snowflake is a Software as a Service (Saas), it is hosted on one of the major cloud providers (I'm using Azure for this course).

To access a Snowflake instance, we don't have to log in to the cloud provider console but can use a URL link to access the Snowflake instance. Snowflake offers users a single and consistent entry point (that ends with snowflakecomputing.com).

## Topic 1: Creating a Multi-cluster Warehouse

- To create an MC WH, we must switch to **SYSADMIN** or a higher role
- Understanding the configuration of the Multi-cluster Warehouse:
	- The MIN and MAX cluster counts should be set differently, by doing this, the MC WH will start with the value set to the MIN_CLUSTER_COUNT as the number of concurrent queries increases and if they exceed the server's capacity and starts to be in a queue, the MC WH will scale up to the MAX_CLUSTER_COUNT.
	- Choosing 'Economy' as the scaling policy will scale the WH only when there are enough queries to keep the additional cluster busy for 6 minutes.
	- AUTO_SUSPEND will automatically suspend the WH if there's no activity for the minutes mentioned.
	- Nodes and WH size:
		XS 	= 1 Node
		S 	= 2 Nodes
		M	= 4 Nodes
		L	= 8 Nodes
		Xl	= 16 Nodes
	
		- Having the highest number of nodes will not always come up with the highest performance, WH's nodes and size should be decided based on the activity that's going to take place on the WH, for example, DBA and admins can benefit out of S, Reporting queries can use M, Data Scientists can use XL and Interactive queries can happen on a L MC WH.
	- AUTO_RESUME will automatically resume a suspended WH once it receives a query.
	- INITIALLY_SUSPENDED, setting true will create the WH in a suspended state.
	
## Topic 2: Understanding the Snowflake UI

- **Worksheets:** Worksheets is the default view that shows up when we open a Snowflake instance and that's where we can write and execute our queries.
- **Databases:** Under Data > Databases, we can find the list of available databases, the owner of the DB, the time when it was created, and we can create new DBs if we have the right privileges.
- **Warehouses:** Under Admin > Warehouses, we can find the list of available Warehouses, the configuration of the Warehouse, the owner of the Warehouse, and the time when it was created, and we can create new Warehouses if we have the right privileges.

## Topic 3: Creating a new DB and Schema in the Multi-cluster Warehouse

- Worksheets can be renamed and organized under a folder, I have created a new folder called 'Self learning' and saved my SQL worksheets based on the query and purpose for better documentation purposes.

- To create a new DB, open or create new SQL worksheets, select the appropriate user with relevant privileges under the 'Run as' option and the warehouse in which the DB should be created. These can be found in the top-right corner of the Web UI. Write and execute the create DB SQL.

- Once the DB is created, write the SQL to create a table and execute it.

- Worksheets can have it's combination of role, virtual warehouse, database, and schema. To execute a query successfully, the user should have a valid role and virtual warehouse. To query a table from a different database and not the one under the database selected in the worksheet, one can fully qualify the database, schema, and table name to do so.

- To check a newly created Database in Snowflake, Use `SHOW DATABASES LIKE '{database_name}' `

- retention_time:
	- When creating a new database using the standard `CREATE DATABASE ` SQL statement, the retention_time of that Database is defaulted to 1 or 1 day. This means Snowflake preserves the state of a data for a day.
	
	- To preserve data more than one day, we need the Enterprise edition and need to set the retention_time while creating an object using the parameter **DATA_RETENTION_TIME_IN_DAYS**
	
	- Time travel option is highly recommended for production databases but not for development and temporary databases. Removing time travel and fail-safe storage options in development regions will help in reduction of storage costs.
	
	- To remove fail-safe storage option while creating a database, use `CREATE TRANSIENT DATABASE` sql over `CREATE DATABASE` sql.
	
	- Time travel option can be configured later after creating a database using the `ALTER DATABASE {name} SET DATA_RETENTION_TIME_IN_DAYS = ` sql.
	
	- ETL processing databases and tables (in Development region) should be created as transient ones and DATA_RETENTION_TIME_IN_DAYS should be set to zero. These tables will often get new data, updates in existing data and deletes, if these tables are created with fail-safe storage and time travel option, we will end up incurring costs for every change that will happen to that table.
	
	- Creating a new database with DATA_RETENTION_TIME_IN_DAYS set to zero and no fail-safe storage option will create the objects within that database with the same configs, but this configs can be manually over-written while creating tables under that database.
	
- Schema:
	- Creating schema under a database will create the schema same as the Database config unless specified.
	
	- To create a new schema `USE DATABASE {db_name} CREATE SCHEMA {schema_name}` , to view a created schema, `SHOW SCHEMAS LIKE '%{schema_name}%' IN DATABASE {db_name};`
	
	- Similar to Databases, schemas can also be created using `CREATE TRANSIENT SCHEMA` to save in storage costs.
	
	- Whenever a new database is created a 'public' schema is created by default along with 'information schema'. The information schema will hold the metadata information like tables, their column and data types.
	
## Topic 4: Creating a new Table in the Multi-cluster Warehouse

- Open a worksheet, select the database and schema where you wish to create the table and use the CREATE TABLE SQL to create the new table.

- To verify the table creation and metadata information, use `DESCRIBE TABLE {table_name};` sql. This shows all the column and column's information in that table.

- If a table's column is created with a wrong datatype or name, we can either use ALTER TABLE sql to update the column, or use the new DDL but with `CREATE OT REPLACE TABLE` sql.

- `REPLACE` is a shorthand for this tradional SQL `DROP TABLE IF EXISTS; CREATE TABLE;`.

- Difference between Deep copy and Shallow copy in Tables:
	- Deep copy is performed using *CTAS* or `CREATE OR REPLACE TABLE customers_deep_copy AS SELECT * FROM customers;` sql, where we copy the table's structure along with the data in it.
	- Shallow copy is copying just the table structure but not the data, `CREATE OR REPLACE TABLE customers_shallow_copy LIKE customers;`.

- Difference between Temporary and Transient Tables:
	- `CREATE TABLE` will create tables with permanent life, where as, `CREATE TEMPORARY TABLE AS` or `CREATE TRANSIENT TABLE AS` will create temporary and transient tables. The temporary tables will be gone once the UI session is killed, but the transient tables will be preserved across sessions but does not consume fail-safe storage.
	
	- Temporary table will exist only till the user's UI session is active and temporary table cannot be viewed or queried by other users.
	
	- Transient tables will exist until explicitly dropped and are visible to any user with the appropriate privileges. Transient tables have a lower level of data protection than permanent tables.
	
	