-- OOE: 1

CREATE OR REPLACE STAGE sfuser_ext_stage
URL='s3://snowflake-cookbook/Chapter02/r4/';

-- OOE: 2

-- LIST command will list all the stage files under that Stage.
LIST @SFUSER_EXT_STAGE;