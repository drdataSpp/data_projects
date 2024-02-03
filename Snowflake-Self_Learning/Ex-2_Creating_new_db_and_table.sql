/*
-- Order of execution: One.
CREATE DATABASE COOKBOOK;

-- Order of execution: Two.
USE DATABASE COOKBOOK;

CREATE OR REPLACE TABLE MY_FIRST_TABLE
(
    ID STRING,
    NAME STRING
);

-- Order of execution: Three.
SELECT * FROM MY_FIRST_TABLE;

-- returns none 
*/

--Creating a database with a default data retention period
CREATE DATABASE my_first_database
COMMENT = 'My first database';

--Creating a database with 15 days of data retention period
CREATE DATABASE production_database
DATA_RETENTION_TIME_IN_DAYS = 15
COMMENT = 'Critical production database';

--Creating a database without the fail-safe storage option
CREATE TRANSIENT DATABASE temporary_database
DATA_RETENTION_TIME_IN_DAYS = 0
COMMENT = 'Temporary database for ETL processing';