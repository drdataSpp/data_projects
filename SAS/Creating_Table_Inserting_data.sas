/* Creating first SQL table in SAS with Data */

libname farms "/home/u59017362/sasuser.v94/Data/SQL Tables";

proc sql;
	create table farms.farm_info
	( FARM_ID 		CHAR(4)
	 ,TOTAL_AREA	num format=comma10.6
	 ,REGION_ID		CHAR(4));

/* Inserting Data into animals table */

insert into farms.farm_info
	values('1001',408.897943, '6')
	values('1002',755.47243,'1')
	values('1003',4438.62891,'5')
	values('1004',4398.7681,'8')
	values('1005',190.0122,'6');	
	
/* Adding a title for the table */

title 'FARMS.FARM_INFO';

SELECT * FROM farms.farm_info;


/* Creating backup for FARM table's data */

proc sql;
	create table farms.farm_info_bkp_20230415 as
		select * from farms.farm_info;
		
/* Creating a one to one view for farms table */

proc sql;
	create view farms.farms_info_v as
		select * from farms.farm_info;
		
/* Query the farms view */

proc sql;
	select * from farms.farms_info_v
	order by farm_id desc;		

proc sql;
	select max(total_area) as Biggest_Farm_in_DB
	from farms.farms_info_v;
	
proc sql; /* Rounding all farm areas :D */
	select round(total_area, 1) as rounded
	from farms.farms_info_v;

/* END of script */		