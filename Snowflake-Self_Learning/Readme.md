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
	
		- Having the highest number of nodes will not always come up with the highest performance, WH's nodes and size should be decided based on the activity that's going to take place on the WH, for example, DBA and admins can be benefitted out of S, Reporting queries can use M, Data Scientists can use XL and Interactive queries can happen on a L MC WH.
	- AUTO_RESUME will automatically resume a suspended WH once it receives a query.
	- INITIALLY_SUSPENDED, setting true will create the WH in a suspended state.
