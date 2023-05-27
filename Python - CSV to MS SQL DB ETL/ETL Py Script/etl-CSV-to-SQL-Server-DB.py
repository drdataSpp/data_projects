#######################################################################################

## PROJECT NAME : Python ETL script to load CSV file into MS SQL Server Database
## Developer    : Soorya Prakash Parthiban
## GitHub       : drdataSpp
## Date         : 27 May, 2023
## Description  : This script checks the header count of the CSV file, compares with the data, if both matches then the data is loaded into the target table.

## Change history

## V1: Pushed draft files with python libraries
## V2: Added python code to check if the source csv data file exists and parameter files & folders 

#######################################################################################

## Importing python libraries
import sys
import os.path
import numpy as np
import pandas as pd
import pyodbc as pySQLConn

## Defining Project Path
PROJECT_PARENT_PATH = "D:/001_Data/data_projects/data_projects/Python - CSV to MS SQL DB ETL"

## Check if source data file exists
    ### Getting File name & File Path from a parameter set (With the help of a paramater file, we can make changes easily without editing the actual source code)

with open(PROJECT_PARENT_PATH + "/Parameter Set/PS_CreditScore.txt") as f:
    lines = f.read().splitlines() 

    ## Variables for file path, file name and file header
    FILE_PATH           = str(lines[0:1]).split("=")[1].replace("']", "").strip()
    FILE_NAME           = str(lines[1:2]).split("=")[1].replace("']", "").strip()
    FILE_HEADER_NAME    = str(lines[2:3]).split("=")[1].replace("']", "").strip()

print(PROJECT_PARENT_PATH + "/" + FILE_PATH + "/" + FILE_NAME)
 
isSourceDataExists = os.path.exists(PROJECT_PARENT_PATH + "/" + FILE_PATH + "/" + FILE_NAME)

if isSourceDataExists == True:
    print("Source file exists")
else:
    print("Source file does not exists. Program is terminating")
    sys.exit()
    
# ## Importing Raw CSV file and Pre-Processing

# raw_df = pd.read_csv(r"D:\001_Data\data_projects\data_projects\Python - CSV to MS SQL DB ETL\raw data\Credit Score Classification Dataset.csv")

# ## Checking the import
# print(raw_df.head())

# ## Checking the header count of the csv source file
# print(raw_df[1:0]) 