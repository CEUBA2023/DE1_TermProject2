# DE1_TermProject2(US Shopping Trends)
## I- The Aim of The Project
 
The purpose of this project is to determine whether variables such as weather, state GDP, and personal income have correlations with shopping trends in the US. For this purpose, it was preferred to use **"Customer Shopping Trends Dataset"** from the kaggle.com [website](https://www.kaggle.com/datasets/iamsouravbanerjee/customer-shopping-trends-dataset). In order to achieve the goal of the project, answers to the following analytical questions were sought.

**1)** Is there a correlation between the number of sweaters purchased and average state temperature?
 
**2)** How does shipping type vary with average state level GDP?

## II- Possible Solutions with Data Processing
 
Before starting analysis, 2 APIs were used to access weather and GDP (income) data and to enrich the our raw data. https://www.ncei.noaa.gov address was used for Weather API data, and https://www.bea.gov/ address was used for gdp API data.

**1) API for GDP and Personal Income Data:**
To obtain the GDP and income data of each state in the USA, a token was first requested by signing up to bea.gov and after the token was received, API data was obtained as in the example below. Since GDP data provides data between 2017 and 2022, personal income data was also drawn between these years to be consistent.


**Example of GDP data request for Alabama:**
https://apps.bea.gov/api/data/?&UserID=F0ED5228-5338-4CCB-A31D-2B4057806465&method=GetData&datasetname=Regional&TableName=SAGDP2N&LineCode=1&GeoFIPS=01000&Year=ALL&ResultFormat=JSON

**Result:**
```json
{"BEAAPI":{"Request":{"RequestParam":[{"ParameterName":"USERID","ParameterValue":"F0ED5228-5338-4CCB-A31D-2B4057806465"},{"ParameterName":"METHOD","ParameterValue":"GETDATA"},{"ParameterName":"DATASETNAME","ParameterValue":"REGIONAL"},{"ParameterName":"TABLENAME","ParameterValue":"SAGDP2N"},{"ParameterName":"LINECODE","ParameterValue":"1"},{"ParameterName":"GEOFIPS","ParameterValue":"01000"},{"ParameterName":"YEAR","ParameterValue":"ALL"},{"ParameterName":"RESULTFORMAT","ParameterValue":"JSON"}]},"Results":{"Statistic":"Gross domestic product (GDP) by state: All industry total","UnitOfMeasure":"Millions of current dollars","PublicTable":"SAGDP2N Gross domestic product (GDP) by state","UTCProductionTime":"2023-12-02T10:49:51.893","NoteRef":" ","Dimensions":[{"Name":"Code","DataType":"string","IsValue":"0"},{"Name":"GeoFips","DataType":"string","IsValue":"0"},{"Name":"GeoName","DataType":"string","IsValue":"0"},{"Name":"TimePeriod","DataType":"string","IsValue":"0"},{"Name":"DataValue","DataType":"numeric","IsValue":"1"},{"Name":"CL_UNIT","DataType":"string","IsValue":"0"},{"Name":"UNIT_MULT","DataType":"numeric","IsValue":"0"}],"Data":[{"Code":"SAGDP2N-1","GeoFips":"01000","GeoName":"Alabama","TimePeriod":"2017","CL_UNIT":"Millions of current dollars","UNIT_MULT":"6","DataValue":"216616"},{"Code":"SAGDP2N-1","GeoFips":"01000","GeoName":"Alabama","TimePeriod":"2018","CL_UNIT":"Millions of current dollars","UNIT_MULT":"6","DataValue":"226264"},{"Code":"SAGDP2N-1","GeoFips":"01000","GeoName":"Alabama","TimePeriod":"2019","CL_UNIT":"Millions of current dollars","UNIT_MULT":"6","DataValue":"234526"},{"Code":"SAGDP2N-1","GeoFips":"01000","GeoName":"Alabama","TimePeriod":"2020","CL_UNIT":"Millions of current dollars","UNIT_MULT":"6","DataValue":"235118"},{"Code":"SAGDP2N-1","GeoFips":"01000","GeoName":"Alabama","TimePeriod":"2021","CL_UNIT":"Millions of current dollars","UNIT_MULT":"6","DataValue":"257987"},{"Code":"SAGDP2N-1","GeoFips":"01000","GeoName":"Alabama","TimePeriod":"2022","CL_UNIT":"Millions of current dollars","UNIT_MULT":"6","DataValue":"281569"}],"Notes":[{"NoteRef":" ","NoteText":"Last updated: September 29, 2023-- revised statistics for 2017-2022."}]}}}
```


**Example of Personal Income data request for Alabama:**
https://apps.bea.gov/api/data/?&UserID=F0ED5228-5338-4CCB-A31D-2B4057806465&method=GetData&datasetname=Regional&TableName=SAINC1&LineCode=1&GeoFIPS=01000&Year=2017,2018,2019,2020,2021,2022&ResultFormat=JSON

**Result:**
```json
{"BEAAPI":{"Request":{"RequestParam":[{"ParameterName":"USERID","ParameterValue":"F0ED5228-5338-4CCB-A31D-2B4057806465"},{"ParameterName":"METHOD","ParameterValue":"GETDATA"},{"ParameterName":"DATASETNAME","ParameterValue":"REGIONAL"},{"ParameterName":"TABLENAME","ParameterValue":"SAINC1"},{"ParameterName":"LINECODE","ParameterValue":"1"},{"ParameterName":"GEOFIPS","ParameterValue":"01000"},{"ParameterName":"YEAR","ParameterValue":"2017,2018,2019,2020,2021,2022"},{"ParameterName":"RESULTFORMAT","ParameterValue":"JSON"}]},"Results":{"Statistic":"Personal income","UnitOfMeasure":"Millions of dollars","PublicTable":"SAINC1 State annual personal income summary: personal income, population, per capita personal income","UTCProductionTime":"2023-12-02T10:50:31.507","NoteRef":" ","Dimensions":[{"Name":"Code","DataType":"string","IsValue":"0"},{"Name":"GeoFips","DataType":"string","IsValue":"0"},{"Name":"GeoName","DataType":"string","IsValue":"0"},{"Name":"TimePeriod","DataType":"string","IsValue":"0"},{"Name":"DataValue","DataType":"numeric","IsValue":"1"},{"Name":"CL_UNIT","DataType":"string","IsValue":"0"},{"Name":"UNIT_MULT","DataType":"numeric","IsValue":"0"}],"Data":[{"Code":"SAINC1-1","GeoFips":"01000","GeoName":"Alabama","TimePeriod":"2017","CL_UNIT":"Millions of dollars","UNIT_MULT":"6","DataValue":"197964"},{"Code":"SAINC1-1","GeoFips":"01000","GeoName":"Alabama","TimePeriod":"2018","CL_UNIT":"Millions of dollars","UNIT_MULT":"6","DataValue":"205674"},{"Code":"SAINC1-1","GeoFips":"01000","GeoName":"Alabama","TimePeriod":"2019","CL_UNIT":"Millions of dollars","UNIT_MULT":"6","DataValue":"215166"},{"Code":"SAINC1-1","GeoFips":"01000","GeoName":"Alabama","TimePeriod":"2020","CL_UNIT":"Millions of dollars","UNIT_MULT":"6","DataValue":"230873"},{"Code":"SAINC1-1","GeoFips":"01000","GeoName":"Alabama","TimePeriod":"2021","CL_UNIT":"Millions of dollars","UNIT_MULT":"6","DataValue":"252792"},{"Code":"SAINC1-1","GeoFips":"01000","GeoName":"Alabama","TimePeriod":"2022","CL_UNIT":"Millions of dollars","UNIT_MULT":"6","DataValue":"258362"}],"Notes":[{"NoteRef":"Note.","NoteText":"All dollar estimates are in millions of current dollars (not adjusted for inflation). Calculations are performed on unrounded data."},{"NoteRef":" ","NoteText":"Last updated: September 29, 2023-- revised statistics for 1979-2022."}]}}}
```


**API Documentation:**
**UserID:** The token we received by requesting from the website  
**GetData:** The method we used to pull the data with this API  
**GeoFIPS:** Code of States  

Detailed documentation for BEA API can be accessed from this [link](https://apps.bea.gov/api/_pdf/bea_web_service_api_user_guide.pdf).


**2) API for Weather Data:**
In order to obtain weather data with this API, we first registered to the ncei.noaa.gov website and requested a token. Using the token sent by the website, API data was obtained by entering KEY values in the Postman application, as in the example below. Since this API provides data until 2017, it was preferred to obtain weather data from January 2015 to December 2017. However, there is a limit of 1000 data imports in Postman, we divided each of these 3 years into 4-month period and then combined them for each year.

<img width="853" alt="Screenshot 2023-12-01 at 22 57 03" src="https://github.com/CEUBA2023/DE1_TermProject2/assets/141356115/4dc6adf3-3b7d-4cb2-9fea-3f5cf4710366">

Weather API Result:
API data provides many temperature values taken from different stations for each month, according to the partial results shown below. These data will then be averaged for each month.

```json
{
   "metadata": {
       "resultset": {
           "offset": 1,
           "count": 4005,
           "limit": 1000
       }
   },
   "results": [
       {
           "date": "2015-01-01T00:00:00",
           "datatype": "TAVG",
           "station": "GHCND:USC00030064",
           "attributes": "4,7",
           "value": 2.3
       },
       {
           "date": "2015-01-01T00:00:00",
           "datatype": "TAVG",
           "station": "GHCND:USC00030130",
           "attributes": ",7",
           "value": 2.8
       } ……
```
**Creating SQL Dump**
A dump named shopping trends dump.sql was created to connect with Knime later. The columns and observations in the table created when we run the sql script can be seen below.

<img width="290" alt="Screenshot 2023-12-02 at 15 02 15" src="https://github.com/CEUBA2023/DE1_TermProject2/assets/141356115/516e7207-abf7-47f7-bb2a-9b2d70eb16b0">
<img width="886" alt="Screenshot 2023-12-02 at 15 04 55" src="https://github.com/CEUBA2023/DE1_TermProject2/assets/141356115/36cdef45-4239-4074-94b6-ad4f743af745"> 


**KNIME:**
After downloading a datatable from Kaggle (loaded Kaggle data set/dump into MySQLWorkbench) and pulling data from APIs, we saved the data into files and saved them to github. After modifying user privileges in MySQLWorkbench to allow access to Knime, we started by connecting MySQLWorkbench to Knime by way of the  'MySQL Connector', and further connecting our main data table in the 'DB Query Reader' node. Next, we used 'File Reader' nodes to load the API data into Knime using github URLs. For each API file, we cleaned the data tables using mainly 'Column Filter', 'Row Filter', 'String Replacer',  'String Manipulation', and 'Column Renamer' nodes. After cleaning, we joined the 4 data tables. In order to produce meaningful visualizations of the data, we had to further alter the datatables, appending more columns needed through  'GroupBy', 'String to Number', 'Math Formula', and 'Binner' nodes.  We then created two visualizations: a bar chart to map shipping type by average state GDP (using 'Bar Chart' node), and a scatter plot displaying the relationship between sweater purchases and average temperature by state and (using 'Color Manager' and 'Scatter Plot' nodes).

