# OH_Hunting_Project
Project Overview
Making up a project to work on that combines my passions. Data & Hunting. To do this I am going to look at harvest data overlayed with weather data. This approach will force me to work with large datasets. So I will clean data in google sheets then convert them into BigQuery to form a dataset with tables. Then Use SQL to combine and make interesting observations. For this to work I need to have a business reason for it. So below is my business tied logic.

Business Problem
Nobody Outdoors wants to transition inot the Ohio Whitetail Guiding space. They currently have no presence in the state. They have hired my team to analyze the data. They did a quick google search and came up with the below counties. They now want to know what weeks they need to charge premium rates, when to charge secondary rates, when to avoid hunts, and when the rut happens. Their clients are mostly interested in bucks but they want to know if there is a good time period to sell cheaper doe hunts.

Ask:

What is the weekly average of antler and antlerless havest over the last 3 years?
Is this a shrinking or expanding market for hunters in Ohio?
What is the top 3 weeks for antler harvest? How about for antlerless? Are they different?
Does weather appear to have an effect on harvest rates?
How does Ohio's gun season compare to weekly average rate?
Using 3 year average, find out how more or less likely for harvest per week versus the 3 year weekly average.

Counties Analyzed
Columbiana
Coshocton
Tuscarawas
Knox
Muskingum
Ashtabula
Guernsey
Carroll
Licking
Holmes



PREPARE:
Data Source

National Oceanic and Atmospheric Administration (NOAA) Sever Storms data
NOAA Hurricane Data
NOAA Hourly Ground forecast
ODNR Weekly Harvest reports per season
ODNR final Harvest report per season
County Size and Public land amount -- Used approximate public land as it was hard to find without going county by county and digitally mapping from onx--

ODNR was easily found on its webpage. The data is presented in a pdf form so no need for requesting the data. Just need to take it from pdf and convert into csv

NOAA hourly I had to request from the home page. Limiting this data to all Ohio stations, dry bulb temperature, dew point temperature, wind obervation, wind gust observation, liquid precipitation hourly, sea level pressure, atmospheric pressure change, sky cover summation, visibility observation and present weather obervation automated. I sent the request and had it back relatively quickly.

PREPARE:
Cleaning the weekly harvest report became quite cumbersome. ODNR puts out total deer harvested so far through report date. I wish I could have the day to day so now I have this information in one week chunks. Next problem is the running tally vs true weekly total. SO to fix this I brought the data into a sheet and subtracted the previous week running total to see the new harvest added. They also kept changing the format. From just archery to archery and total to archery gun and total. I also found quite a few places where the had negative harvest built into the sheet. In the place of negative harvest I defaulted the negative to 0 since you can unharvest a deer. 

Next NOAA hourly is a complex massive data set. With columns where the rows contained multiple values separated by commas. So I use split text to columns on the commas. I deleted out any column that explained how the data was collected. I also found and replaced their numeric values for no measurements with a blank. Example being in wind direction they put a value of 999 where max possible is 360, so now instead of throwing off the numbers I will have a null value in place. 

Side note: This has became a way bigger undertaking than I originally thought. Just one year of harvest data took longer than I thought. Orginally thought of doing a 10 year average but shifted to 3 year and updated the project. 

Analyze:
All 3 harvest data years are in there. Getting some clear pictures of lead counties and time periods. None of which are surprising. What I am going to do is help my outfitter pick 3 counties to start in. Give him his 5 premium week hunts and 5 to avoid. After we have that. I will go back and check weather patterns against those weeks historically and give predictions for weather to expect. 

