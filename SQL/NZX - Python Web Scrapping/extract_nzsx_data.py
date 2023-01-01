###############################################################################

## Web Data Scrapping
## Author: Soorya P Parthiban
## Website Name: NZX - NZX Main Board 

###############################################################################

import pandas as pd
from datetime import date, datetime
import os
from os import path
import time

## When this program started
etl_starttime = time.time()

## Path where data should be scrapped from
url = 'https://www.nzx.com/markets/NZSX'

## Assigning the tabular data to a Pandas dataframe
NZSX_df = pd.read_html(url)[0]

## Finding today's date to use it in the csv filename
today = str(date.today())

## Checking if file already exists
is_File_Exists = os.path.exists(r'C:\Users\soory\NZSX_Data_'+today+'.csv')

## Create file if not exists

## Saving dataframe to a csv file in the working directory if not existing
if is_File_Exists == False:
    NZSX_df.to_csv('NZSX_Data_'+today+'.csv', header=True, index=False)
    print("No file exists, new file created @ " + str(datetime.now()))
    print("ETL Task completed")
    
else:
    os.remove('NZSX_Data_'+today+'.csv')
    NZSX_df.to_csv('NZSX_Data_'+today+'.csv', header=True, index=False)
    print("Existing file was removed, new file created @ " + str(datetime.now()))

## When this program finished    
etl_endtime = time.time()

print("The time of execution for this ETL task is :",
      round((etl_endtime-etl_starttime), 2), "seconds")

## END OF PROGRAM    




