# OH_Hunting_Project
Project Overview
Making up a project to work on that combines my passions. Data & Hunting. To do this I am going to look at harvest data overlayed with weather data. This approach will force me to work with large datasets. So I will clean data in google sheets then convert them into BigQuery to form a dataset with tables. Then Use SQL to combine and make interesting observations. For this to work I need to have a business reason for it. So below is my business tied logic.

Business Problem
Nobody Outdoors wants to transition into the Ohio Whitetail Guiding space. They currently have no presence in the state. They have hired my team to analyze some data. They did a quick google search and came up with the below counties. They now want to know what weeks they need to charge premium rates, when to charge secondary rates, when to avoid hunts, and when the rut happens. Their clients are mostly interested in bucks but they want to know if there is a good time period to sell cheaper doe hunts.

Ask:

What is the weekly average of antler and antlerless havest over the last 3 years?
Is this a shrinking or expanding market for hunters in Ohio?
What is the top 3 weeks for antler harvest x? How about for antlerless? Are they different?
Does weather appear to have an effect on harvest rates?
How does Ohio's gun season compare to weekly average rate x?
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
Based on the data so far. Weeks 6 - 11 of the season are the prime window of hunting for Bucks. Covering From the First days of November through the Ohio Gun Season. Ohio post weekly results on Wednesdays so the gun hunt data is split on weeks 10 and 11. Week 9 data has the Youth Gun weekend harvest in it. Weeks 6-8 are archery hunting indicating peek buck movement in these windows. These are my prime windows. For buck specific hunts I would plan on doing 5 day Archery Hunts Starting Halloween weekend running through the first 15 days of November. After that Gun packages would be Youth Weekend Package and 1st half and second half of gun week. 1st Half of Gun would be my highest priced hunt. Followed by 2nd half. Then Archery and Youth Hunts would all be in the 3rd tier. You can see the results in the attached pdf. 

Year	Month	Day	Week of the Season	Year_Week_of_season	Harvest weapon	Total_Antlered	Combined_Weekly_Avg	percent_of_avg
2025	12	  9	      11	                    2025-11	          Gun	        3545	            2514	              141.0103421
2025	12	  2	      10	                    2025-10	          Gun	        3943	            2514	              156.8416866
2025	11	  4	      6	                      2025-6	          Bow	        2978	            2514	              118.4566428
2025	11	  25	    9	                      2025-9	          Bow	        1973	            2514	              78.48050915
2025	11	  11	    7	                      2025-7	          Bow	        3267	            2514	              129.9522673
2024	12	  3	      10	                    2024-10	          Gun	        4084	            2514	              162.4502784
2024	12	  10	    11	                    2024-11	          Gun	        3130	            2514	              124.5027844
2024	11	  5	      6	                      2024-6	          Bow	        2608	            1257	              207.4781225
2024	11	  19	    8	                      2024-8	          Bow	        2909	            2514	              115.7120127
2024	11	  12	    7	                      2024-7	          Bow	        3222	            1257	              256.3245823
2023	12	  5	      11	                    2023-11	          Gun	        3032	            2514	              120.6046142
2023	11	  7	      7	                      2023-7	          Bow	        3704	            2514	              147.3349244
2023	11	  28	    10	                    2023-10	          Gun	        3581	            2514	              142.442323
2023	11	  21	    9	                      2023-9	          Bow	        2707	            2514	              107.6770088
2023	11	  14	    8	                      2023-8	          Bow	        2961	            2514	              117.7804296

Wanted to know how Gun week fairs vs the average. Above data is held to my 10 counties. When compared to weekly average, guy week yields roughly 142% so significant increased chance at harvesting an antlered deer.

