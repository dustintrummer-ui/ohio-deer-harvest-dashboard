-- =====================================================
-- Ohio Deer Harvest Dashboard Queries
-- Apex Hunting Solutions
-- Purpose:
-- Core SQL queries used to build the Ohio Deer Harvest Dashboard
-- covering archery and gun harvest trends by county and season week.
-- =====================================================


-- =====================================================
-- ARCHERY QUERIES
-- =====================================================

-- 1. Average Weekly Archery Harvest by County
-- Returns the average weekly buck and doe harvest by county
-- across the dataset for archery season only.
SELECT
    o.County,
    AVG(c.Antlered) AS avg_weekly_buck_harvest,
    AVG(c.Antlerless) AS avg_weekly_doe_harvest
FROM harvest_weekly c
JOIN Ohio_County_data o
    ON c.county_id = o.county_id
WHERE c.harvest_method_id = 1
GROUP BY o.County
ORDER BY avg_weekly_buck_harvest DESC;


-- 2. Total Archery Harvest by County
-- Returns total buck and doe harvest by county for archery season
-- across the full dataset.
SELECT
    o.County,
    SUM(c.Antlered) AS total_buck_harvest,
    SUM(c.Antlerless) AS total_doe_harvest
FROM harvest_weekly c
JOIN Ohio_County_data o
    ON c.county_id = o.county_id
WHERE c.harvest_method_id = 1
GROUP BY o.County
ORDER BY total_buck_harvest DESC;


-- 3. Average Yearly Archery Harvest by County
-- Sums harvest by county within each season year, then averages those
-- yearly totals across the dataset.
SELECT
    county,
    AVG(yearly_bucks) AS avg_yearly_bucks,
    AVG(yearly_does) AS avg_yearly_does
FROM (
    SELECT
        o.County AS county,
        c.season_start_year,
        SUM(c.Antlered) AS yearly_bucks,
        SUM(c.Antlerless) AS yearly_does
    FROM harvest_weekly c
    JOIN Ohio_County_data o
        ON c.county_id = o.county_id
    WHERE c.harvest_method_id = 1
    GROUP BY
        o.County,
        c.season_start_year
) AS yearly_totals
GROUP BY county
ORDER BY avg_yearly_bucks DESC;


-- 4. Statewide Average Archery Harvest by Season Week
-- Sums harvest for each season week within each season year, then averages
-- those weekly totals across the dataset.
SELECT
    season_week_number,
    AVG(weekly_bucks) AS avg_bucks,
    AVG(weekly_does) AS avg_does
FROM (
    SELECT
        season_week_number,
        season_start_year,
        SUM(antlered) AS weekly_bucks,
        SUM(antlerless) AS weekly_does
    FROM harvest_weekly
    WHERE harvest_method_id = 1
    GROUP BY
        season_week_number,
        season_start_year
) AS weekly_totals
GROUP BY season_week_number
ORDER BY season_week_number;


-- 5. Average Weekly Archery Harvest by County and Season Week
-- Builds county-by-week averages across the dataset for archery season.
SELECT
    county,
    season_week_number,
    AVG(yearly_bucks) AS avg_weekly_bucks,
    AVG(yearly_does) AS avg_weekly_does
FROM (
    SELECT
        o.County AS county,
        c.season_week_number,
        c.season_start_year,
        SUM(c.Antlered) AS yearly_bucks,
        SUM(c.Antlerless) AS yearly_does
    FROM harvest_weekly c
    JOIN Ohio_County_data o
        ON c.county_id = o.county_id
    WHERE c.harvest_method_id = 1
    GROUP BY
        o.County,
        c.season_week_number,
        c.season_start_year
) AS yearly_totals
GROUP BY
    county,
    season_week_number
ORDER BY avg_weekly_bucks DESC;


-- =====================================================
-- GUN QUERIES
-- =====================================================

-- 6. Total Gun Harvest by County
-- Returns total buck and doe harvest by county for gun season
-- across the full dataset.
SELECT
    o.County,
    SUM(c.Antlered) AS total_buck_harvest,
    SUM(c.Antlerless) AS total_doe_harvest
FROM harvest_weekly c
JOIN Ohio_County_data o
    ON c.county_id = o.county_id
WHERE c.harvest_method_id = 2
GROUP BY o.County
ORDER BY total_buck_harvest DESC;


-- 7. Top 10 Gun Counties with Acreage and Public Land Context
-- Returns the top counties for gun harvest along with county acreage,
-- public land acreage, and public land percentage.
SELECT
    o.County,
    SUM(c.Antlered) AS total_buck_harvest,
    SUM(c.Antlerless) AS total_doe_harvest,
    o.Area_Acres,
    o.Public_land_acres,
    (o.Public_land_acres * 1.0 / o.Area_Acres) * 100 AS public_land_percent
FROM harvest_weekly c
JOIN Ohio_County_data o
    ON c.county_id = o.county_id
WHERE c.harvest_method_id = 2
GROUP BY
    o.County,
    o.Area_Acres,
    o.Public_land_acres
ORDER BY total_buck_harvest DESC
LIMIT 10;


-- 8. Statewide Average Gun Harvest by Season Week
-- Sums gun harvest for each season week within each season year, then averages
-- those weekly totals across the dataset.
SELECT
    season_week_number,
    AVG(weekly_bucks) AS avg_bucks,
    AVG(weekly_does) AS avg_does
FROM (
    SELECT
        season_week_number,
        season_start_year,
        SUM(antlered) AS weekly_bucks,
        SUM(antlerless) AS weekly_does
    FROM harvest_weekly
    WHERE harvest_method_id = 2
    GROUP BY
        season_week_number,
        season_start_year
) AS weekly_totals
GROUP BY season_week_number
ORDER BY season_week_number;
