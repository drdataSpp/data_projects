/* Importing a CSV file and creating a table in WORK library - Temporary */

proc import datafile="/home/u59017362/sasuser.v94/Data/Raw Data/ElectricCarData_Clean.csv"
			out = cars
			dbms = csv replace;
run;

/* Importing a CSV file and creating a table in Custom library - Permanent */

libname sasStg "/home/u59017362/sasuser.v94/Data/SAS Staging";

proc import datafile="/home/u59017362/sasuser.v94/Data/Raw Data/ElectricCarData_Clean.csv"
			out = sasStg.cars
			dbms = csv replace;
run;