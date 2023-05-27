#######################################################################################

## PROJECT NAME : Python ETL script to load CSV file into MS SQL Server Database
## Developer    : Soorya Prakash Parthiban
## GitHub       : drdataSpp
## Date         : 27 May, 2023
## Description  : This script checks the header count of the CSV file, compares with the data, if both matches then the data is loaded into the target table.

## Change history

## V1 - 2023-05-27 - Pushed draft files with python libraries
## V2 - 2023-05-27 - Added python code to check if the source csv data file exists and parameter files & folders 
## V3 - 2023-05-28 - Added LOGS folder to create .txt logs on failure. Added row count checks and business date checks
## V4 - 2023-05-28 - Added code to create processed data frame & established SQL Server connection using pyodbc
#######################################################################################

## Importing python libraries
import sys
import datetime
from datetime import date
import os.path
import numpy as np
import pandas as pd
import pyodbc as pySQLConn

## Defining Project Path
PROJECT_PARENT_PATH = "D:/001_Data/data_projects/data_projects/Python - CSV to MS SQL DB ETL"

## Defining Business Date
## FORMAT: DD/MM/YYYY
BUSINESS_DATE = datetime.date.today().strftime("%d") + "/" + datetime.date.today().strftime("%m") + "/" + datetime.date.today().strftime("%Y")

## Clearing old logs from the LOGS folder before running the script
filelist = [ f for f in os.listdir(PROJECT_PARENT_PATH + "/logs") if f.endswith(".txt") ]
for f in filelist:
    os.remove(os.path.join(PROJECT_PARENT_PATH + "/logs", f))
    
## Clearing pre-processed csv files from the processed data folder before running the script
filelist = [ f for f in os.listdir(PROJECT_PARENT_PATH + "/processed data") if f.endswith(".csv") ]
for f in filelist:
    os.remove(os.path.join(PROJECT_PARENT_PATH + "/processed data", f))

## Check if source data file exists
    ### Getting File name & File Path from a parameter set (With the help of a paramater file, we can make changes easily without editing the actual source code)

with open(PROJECT_PARENT_PATH + "/Parameter Set/PS_CreditScore.txt") as f:
    lines = f.read().splitlines() 

    ## Variables for file path, file name and file header
    SOURCE_DATA_FOLDER_NAME = str(lines[0:1]).split("=")[1].replace("']", "").strip()
    FILE_NAME               = str(lines[1:2]).split("=")[1].replace("']", "").strip()
 
isSourceDataExists = os.path.exists(PROJECT_PARENT_PATH + "/" + SOURCE_DATA_FOLDER_NAME + "/" + FILE_NAME)

if isSourceDataExists == True:
    ## Importing Raw CSV file and Pre-Processing
    raw_df = pd.read_csv(PROJECT_PARENT_PATH + "/" + SOURCE_DATA_FOLDER_NAME + "/" + FILE_NAME, header=0)
    FILE_BUSINESS_DATE = raw_df.columns.tolist()[1]
    
    ## Business Date comparision
    
    if BUSINESS_DATE == FILE_BUSINESS_DATE:
        
        ## If program's business date matches with source file's business date then check for row count with header row count value 
        SOURCE_FILE_ROW_COUNT = int(raw_df.columns.tolist()[0])
        DF_ROW_COUNT          = int(raw_df.shape[0])
        
        if SOURCE_FILE_ROW_COUNT == DF_ROW_COUNT:
            
            ## If all three checkpoints are cleared, we will create a data frame without the header values and establish SQL Server Database connection
            
            ## Create data frame excluding the header count values for loading into the Database table
            processed_df = pd.read_csv(PROJECT_PARENT_PATH + "/" + SOURCE_DATA_FOLDER_NAME + "/" + FILE_NAME, header=1)
        
            processed_df.to_csv(PROJECT_PARENT_PATH + "/processed data/" + datetime.date.today().strftime("%d") + "-" + datetime.date.today().strftime("%m") + "-" + datetime.date.today().strftime("%Y") + "_" + FILE_NAME)
            
            
            ## SQL Server connection
                        
            sqlConn = pySQLConn.connect("Driver={SQL Server};"
                      "Server=LAPTOP-MCNKFD7O;"
                      "Database=PY_ELT_Acquisition_Db;"
                      "Trusted_Connection=yes;")
            
            cursor = sqlConn.cursor()
            
            tableResult = pd.read_sql("SELECT * FROM CreditScore_V", sqlConn)
            
            print(tableResult) ## Connection works
            
        else:
            ROW_COUNT_ERROR = "FAILED in STEP 3: Source file Header Row Count and Data Count doesn't match"
            ROW_COUNT_ERROR_FILENAME = "RowCountError_" + str(datetime.datetime.now().date()) + "_"+ datetime.datetime.now().strftime("%H") + "_"+ datetime.datetime.now().strftime("%M") + "_"+ datetime.datetime.now().strftime("%S") + ".txt"
            
            with open(PROJECT_PARENT_PATH + "/logs/" + ROW_COUNT_ERROR_FILENAME, 'w') as f:
                f.write(ROW_COUNT_ERROR)
                
            sys.exit()
        
    else:
        BUSINESS_DATE_ERROR = "FAILED in STEP 2: Source file Business Date and Program's Business Date doesn't match"
        BUSINESS_DATE_ERROR_FILENAME = "BusinessDateError_" + str(datetime.datetime.now().date()) + "_"+ datetime.datetime.now().strftime("%H") + "_"+ datetime.datetime.now().strftime("%M") + "_"+ datetime.datetime.now().strftime("%S") + ".txt"
        
        with open(PROJECT_PARENT_PATH + "/logs/" + BUSINESS_DATE_ERROR_FILENAME, 'w') as f:
            f.write(BUSINESS_DATE_ERROR)
            
        sys.exit()
        
else:
    FILE_MISSING_ERROR = "FAILED in STEP 1: Source file doesn't exist in the raw_data folder"
    FILE_MISSING_ERROR_FILENAME = "SourceFileMissingError_" + str(datetime.datetime.now().date()) + "_"+ datetime.datetime.now().strftime("%H") + "_"+ datetime.datetime.now().strftime("%M") + "_"+ datetime.datetime.now().strftime("%S") + ".txt"
        
    with open(PROJECT_PARENT_PATH + "/logs/" + FILE_MISSING_ERROR_FILENAME, 'w') as f:
        f.write(FILE_MISSING_ERROR)
    
    sys.exit()