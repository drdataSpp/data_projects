#!/bin/bash

## Calling Python ELT script
## Arguements: Load process PARAM JSON File

## IF Loop to check if Parameter file is supplied
if [ $# -eq 0 ]
  then
    echo "Load process JSON Parameter file not supplied"

else
	python -W "ignore" /d/001_Data/data_projects/data_projects/Python\ ELT/PELT\ Script/PELT_CSV_to_SQLDB_load.py $1

	## Printing LOAD process status message 
	cat /d/001_Data/data_projects/data_projects/Python\ ELT/logs/*.txt
fi