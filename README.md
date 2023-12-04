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
**3) Creating SQL Dump**
A dump named shopping trends dump.sql was created to connect with Knime later. The columns and observations in the table created when we run the sql script can be seen below.

![unnamed (4)](https://github.com/CEUBA2023/DE1_TermProject2/assets/141356115/2c4d39f2-66f7-4c6f-b6cd-6ef7f387d671) <img width="1435" alt="Screenshot 2023-12-02 at 15 00 42" src="https://github.com/CEUBA2023/DE1_TermProject2/assets/141356115/77bf163c-d04a-4378-a956-33d6e5eb0a25">


 
**4) KNIME:**
After downloading a data table from Kaggle (loaded Kaggle data set/dump into MySQLWorkbench) and pulling data from APIs, we saved the data into files and saved them to GitHub. After modifying user privileges in MySQLWorkbench to allow access to Knime, we started by connecting MySQLWorkbench to Knime by way of the  'MySQL Connector', and further connecting our main data table in the 'DB Query Reader' node. Next, we used 'File Reader' nodes to load the API data into Knime using Github URLs. For each API file, we cleaned the data tables using mainly 'Column Filter', 'Row Filter', 'String Replacer',  'String Manipulation', and 'Column Renamer' nodes. After cleaning, we joined the 4 data tables. In order to produce meaningful visualizations of the data, we had to further alter the datatables, appending more columns needed through  'GroupBy', 'String to Number', 'Math Formula', and 'Binner' nodes.  We then created three visualizations: 
* A bar chart to map shipping type by average state GDP 
* A bar chart to map sandal purchases per region compared to average yearly temperatures (using 'Bar Chart' node)
* A scatter plot displaying the relationship between sweater purchases and average temperature by state (using 'Color Manager' and 'Scatter Plot' nodes).

![unnamed](https://github.com/CEUBA2023/DE1_TermProject2/assets/141356115/7d428613-4fd6-4a9c-b8c6-2254b9571894)

**5) ER diagram for RDBMS**  
We didn't include an ER diagram as we didn't use a relational dataset. All of our data tables are related through the key ID of state/location

**6) Analytics and/or visualization0**  
 **6.1.** Is there a correlation between the number of sweaters purchased and average state temperature?

![unnamed (1)](https://github.com/CEUBA2023/DE1_TermProject2/assets/141356115/448e92d6-7fde-478d-8c64-16feb011c2a8) 

**Analysis:** Despite the synthetic data on shopping trends, it seems on average, that sweater purchases tend to follow a general pattern: More sweaters are bought in states with lower average temperatures, compared to those with higher average temperatures in which fewer sweaters are purchased.

**6.2.** How does shipping type vary with the average state-level GDP?

![unnamed (2)](https://github.com/CEUBA2023/DE1_TermProject2/assets/141356115/debb4449-a68d-4e2b-868a-7e981a1f2dcf)

**Analysis:** 
We can make out a few trends from the bar chart:
(1) Highest amount of free shipping tends to come from the states with the highest level of GDP
a. Reason? For most shops, one must reach a price threshold in order to unlock free shipping. Therefore, those able to spend more (higher state GDP), more often have this option.
(2). Highest levels of store pickup relates to lowest level of state GDP
a. Reason? Customers may opt for in-store pickup in order to forgo shipping costs

**6.3.** How do sandal purchases compare in different US regions with varying average temperatures?

![unnamed (3)](https://github.com/CEUBA2023/DE1_TermProject2/assets/141356115/ad16c15b-9038-4ba2-87d0-91c01feae66f)

**Analysis:**
Assumption: We expected purchases to be higher in regions with warmer average climate. The data shows that colder climates purchased more sandals

**Possible Reasons:** 
. Regions in the U.S. that are traditionally colder might have a higher population (ex. New england, middle atlantic) leading to overall higher purchases
. Customers in colder climates may relish their respective summers more and therefore make more 'summer' purchases when appropriate

**7) Conclusion**
Based on our analytical questions, we had the test hypothesis that average temperatures would influence the type of purchases made across the US when accounting for GDP. From our analysis, however, those assumptions did not hold true in all cases. From the analysis of sweaters and sandals, we can see that items associated with colder seasons fit the hypothesis but items associated with warmer seasons do not. A correlation cannot be made between temperature and shopping trends as expected. When accounting for GDP, as noted above, it could be reasoned that states with higher average GDPs are purchasing more overall, which would also fit normal economic conventions due to higher purchasing power. 

