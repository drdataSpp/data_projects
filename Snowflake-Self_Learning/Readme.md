# Snowflake Self-Learning Documentation

A free account was created using the "Enterprise" edition.
Enterprise edition supports multi-cluster virtual warehouses and up to 90 days of time travel.

Snowflake is a Software as a Service (Saas), it is hosted on one of the major cloud providers (I'm using Azure for this course).

To access a Snowflake instance, we don't have to log in to the cloud provider console but can use a URL link to access the Snowflake instance. Snowflake offers users a single and consistent entry point (that ends with snowflakecomputing.com).

## Exercise 1: Creating a Multi-cluster Warehouse

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
	
## Exercise 2: Understanding the Snowflake UI

- **Worksheets:** Worksheets is the default view that shows up when we open a Snowflake instance and that's where we can write and execute our queries.
- **Databases:** Under Data > Databases, we can find the list of available databases, the owner of the DB, the time when it was created, and we can create new DBs if we have the right privileges.
- **Warehouses:** Under Admin > Warehouses, we can find the list of available Warehouses, the configuration of the Warehouse, the owner of the Warehouse, and the time when it was created, and we can create new Warehouses if we have the right privileges.

## Exercise 3: Creating a new DB, new Table, and querying in the Multi-cluster Warehouse

- Worksheets can be renamed and organized under a folder, I have created a new folder called 'Self learning' and saved my SQL worksheets based on the query and purpose for better documentation purposes.

- To create a new DB, open or create new SQL worksheets, select the appropriate user with relevant privileges under the 'Run as' option and the warehouse in which the DB should be created. These can be found in the top-right corner of the Web UI. Write and execute the create DB SQL.

- Once the DB is created, write the SQL to create a table and execute it.

- Worksheets can have it's combination of role, virtual warehouse, database, and schema. To execute a query successfully, the user should have a valid role and virtual warehouse. To query a table from a different database and not the one under the database selected in the worksheet, one can fully qualify the database, schema, and table name to do so.
