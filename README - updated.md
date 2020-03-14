# ETL-project
Harmony, Robert and Daniel's baller transformation of COVID-19/Weather data which could potentially save lives. What did you do with your Saturday morning?

We are looking to create a Database of confirmed cases for the Corona Virus combined with Weather Data from those areas to see if there is a correllation between weather and the number of confirmed cases.

# This read me corresponds to the updated covid_weather_transformation_update.ipynb file. 

Step #1 start with a clean environment and import your required dependencies. (separate text file included)

Step #2 import os
        import pandas as pd
        import csvs as a dataframe.


# Data Sets used for our Database

Data Set #1 used is from https://data.humdata.org/dataset/novel-coronavirus-2019-ncov-cases

The CSV gathered includes the Novel Corona Virus (COVID-19) epidemiological data since 22 January 2020 to current. 

Fields available within the data include Province/State, Country/Region, Latitude and Longitude, Date of Last Update, Confirmed, Suspected, Recovered, Deaths.  For our purposes for this project we are only using the Confirmed cases. 

Data Set #2 used is from http://ncdc.noaa.gov/cdo-web/search

The CSV gathered includes Weather Data during the same sampled time frame. 

Fields available include State/Country, Latitude and Longitude, Precipitation, Minimum, Maximum and Average Temp for our chosen date ranges.

# Data Cleanup and Analysis

We used Pandas to import our CSVs into a dataframe to clean up the data. 
    
First, we cleaned the Covid - 19 data - confirmed cases; the initial CSV was broken out over time from 1-22 through 3-6 which produced 49 colums so our next step was to combine the individual dates into monthly data for each Province/State and Country/Region.  We knew that the Country would be our primary Key within the final SQL tables created along with an ID as a foreign key.  So we worked to clean up the country listing to correspond to our weather data country listing, and then created a 3rd listing with ID and Country data. Some examples that we changed are both San Marino and Vatican City are micro states within Italy, we changed US to be United States and changed UK to be United Kingdom.  We ended up with a total Country listing of 89 countries.  We also did some further analysis of total cases and calculated those numbers for Mainland China vs the spread of Covid 19 to other countries as well as the calculations of cases of Northern Hemisphere vs Southern Hemisphere. 

Second, we cleaned the Weather Data - We began by dropping some unneeded columns for example elevation and ended up with 5 columns, Country, Precipitation, Temp Avg, Temp Max and Temp Min. Initially, we had a date column broken out by days and we converted that to be Months to correspond with our Covid - 19 data and then added the data back into the dataframe ending up with 6 columns. We then went through a process of calculating the average, minimum and maximum temps for each month for each country and then printed this data to check our information.  Once that was complete different dataframes were created for each month to combine all data for each month and then merged back together that way we went from listing out individual monthly dates to a listing of the countries with an Average temp, min temp and max temp for each month.   

Once both data sets were cleaned via pandas in a dataframe, they were saved back to a csv to be used with Postgres and pgadmin and created our ERD within GenMyModel.

# Load data to SQL (PgAdmin and GenMyModel)

We began by creating an ERD within GenMyModel to connect our Covid - 19 data with our Weather data using the Country as the Key. Next using PgAdmin we created a Database called ETL - Project and imported our cleaned CSVs.  

We created a schema and two tables one Covid -19 and the other Weather (screenshots shown within Project Report).  We chose the relational database so that we could represent and store data in tables and rows as opposed to data in collections of JSON. 

# Final Analysis

Yes, there is a correlation between the weather and the spread of Covid – 19 into other countries.  The total confirmed cases in the Northern Hemisphere are 2,275,960 with only 864 confirmed cases within the Southern Hemisphere.  This suggests that since the Northern Hemisphere is experiencing its winter and the Southern Hemisphere its Summer that in warmer weather the spread of this virus is less rampant. 










 
