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

## Importing Raw CSV file and Pre-Processing

raw_df = pd.read_csv(r"D:\001_Data\data_projects\data_projects\Python - CSV to MS SQL DB ETL\raw data\Credit Score Classification Dataset.csv")

## Checking the import
print(raw_df.head())

## Checking the header count of the csv source file
print(raw_df[1:0]) 