#######################################################################################

## PROJECT NAME : Python ETL script to load CSV file into MS SQL Server Database
## Developer    : Soorya Prakash Parthiban
## GitHub       : drdataSpp
## Date         : 27 May, 2023
## Description  : This script checks the header count of the CSV file, compares with the data, if both matches then the data is loaded into the target table.

## Change history

## V1: Pushed draft files with python libraries 

#######################################################################################

## Importing python libraries
import numpy as np
import pandas as pd
import pyodbc as pySQLConn