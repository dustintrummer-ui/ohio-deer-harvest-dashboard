# OH_Hunting_Weather
Project Overview

A hunting outfitter operating in multiple Ohio counties wants to increase bookings for non-rut whitetail hunts (November 1–10).

A common industry belief suggests that sharp negative temperature swings increase daylight buck movement.

This project analyzes historical NOAA weather data to:

Identify significant day-over-day temperature drops

Rank high-volatility weather days

Score counties based on frequency of favorable conditions

Provide a repeatable framework for marketing high-probability hunt dates

This repository serves as a living analytics project, continuously expanding as new skills (Python automation, modeling, visualization, and app deployment) are added.

Business Problem

Objective:
Determine which dates between November 1–10 historically present the strongest negative temperature swings across selected Ohio counties.

End Goal:
Enable outfitters to strategically market “high volatility” non-rut hunt windows backed by data rather than anecdote.

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

Data Source

Weather data sourced from:
National Oceanic and Atmospheric Administration (NOAA)

Dataset includes:

Daily high temperature

Daily low temperature

Daily average temperature

County-level geographic filtering

Multi-year historical data

Analytical Approach

1 Data Filtering

Restricted dataset to November 1–10

Filtered by selected counties

Aggregated by date and county

2 Temperature Swing Calculation

Used SQL window functions to calculate day-over-day changes:

3 Scoring Model

Temperature swings scored as:

≤ -20°F → High Volatility (Score 3)

≤ -10°F → Moderate Volatility (Score 2)

-5°F → Low Volatility (Score 1)

4 Ranking & Insights

Ranked days within each county

Identified recurring high-volatility patterns

Evaluated cross-county consistency

🛠️ Technical Stack

SQL (CTEs, window functions, aggregations)

Structured query modularization

Data cleaning and transformation

Version-controlled workflow
