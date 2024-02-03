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

/* returns none */ 