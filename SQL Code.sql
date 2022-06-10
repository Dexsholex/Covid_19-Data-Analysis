-- SQL QUERIES FOR COVID_19 -- 

-------------------------------------------------------------------------------------------------------------------
-- All columns from Covid_Deaths Table.
SELECT *
FROM deaths
WHERE continent IS NOT NULL -- filters out the continents in the location column.
ORDER BY 4,5;


--------------------------------------------------------------------------------------------------------------------
-- Columns to be used.
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM deaths
WHERE continent IS NOT NULL -- filters out the continents in the location column.
ORDER BY 1,2;


-------------------------------------------------------------------------------------------------------------------
-- Looking at Total Cases vs Total Deaths
-- Shows likelihood of dying if you are infected with covid_19
SELECT location, date,  total_deaths, total_cases, (total_deaths/total_cases)*100 AS death_percentage
FROM deaths
WHERE continent IS NOT NULL -- filters out the continents in the location column.
ORDER BY 1,2 DESC NULLS LAST; --setting NULLS LAST because NULL is larger than non-NULL values.;


--------------------------------------------------------------------------------------------------------------------
-- Total Cases vs Population  
-- Shows percentage of people infected with covid_19
SELECT location, date, total_cases, population,  (total_cases/population)*100 AS infected_population_percentage
FROM deaths
WHERE continent IS NOT NULL -- filters out the continents in the location column.
ORDER BY 1,2;

 
--------------------------------------------------------------------------------------------------------------------
-- Countries with Highest Infection Rate compared to Popoulation 
SELECT location, population, SUM(new_cases) AS infection_count,
		SUM(new_cases/population)*100 AS infected_population_percentage
FROM deaths
WHERE continent IS NOT NULL -- filters out the continents in the location column.
GROUP BY 1,2
ORDER BY 4 DESC NULLS LAST; --setting NULLS LAST because NULL is larger than non-NULL values.


--------------------------------------------------------------------------------------------------------------------
-- Countries with Highest Death Count
SELECT location, SUM(new_deaths) AS total_death_count
FROM deaths
WHERE continent IS NOT NULL -- filters out the continents in the location column.
GROUP BY 1
ORDER BY 2 DESC NULLS LAST; -- setting NULLS LAST because NULL is larger than non-NULL values.


--------------------------------------------------------------------------------------------------------------------
-- Countries with Highest Death Count per Popoulation 
SELECT location, population, SUM(new_deaths) AS death_count, 
		SUM(new_deaths/population)*100 AS death_population_percentage
FROM deaths
WHERE continent IS NOT NULL -- filters out the continents in the location column.
GROUP BY 1,2
ORDER BY 4 DESC NULLS LAST; -- setting NULLS LAST because NULL is larger than non-NULL values.


--------------------------------------------------------------------------------------------------------------------
-- WORKING WITH CONTINENTS --

-- Continents with Highest Infection Count
SELECT location, MAX(total_cases) AS total_infection_count
FROM deaths
WHERE continent IS NULL -- Query for continents only
AND location NOT IN ('World', 'Upper middle income', 'High income', 'Lower middle income', 
					 'European Union', 'International', 'Low income') -- filter out locations with these rows (non continents rows)
GROUP BY 1
ORDER BY 2 DESC NULLS LAST; --setting NULLS LAST because NULL is larger than non-NULL values.


---------------------------------------------------------------------------------------------------------------------
-- Continents with Highest Infection Rate per Population
SELECT location, population, SUM(new_cases) AS infection_count, 
		SUM(new_cases/population)*100 AS infected_population_percentage
FROM deaths
WHERE continent IS NULL -- Query for continents only
AND location NOT IN ('World', 'Upper middle income', 'High income', 'Lower middle income', 
					 'European Union', 'International', 'Low income') -- filter out locations with these rows (non continents rows)
GROUP BY 1,2
ORDER BY 3 DESC NULLS LAST; -- Setting NULLS LAST because NULL is larger than non-NULL values


---------------------------------------------------------------------------------------------------------------------
-- Continents with Highest Death Count
SELECT location, SUM(new_deaths) AS total_death_count
FROM deaths
WHERE continent IS NULL -- Query for continents only
AND location NOT IN ('World', 'Upper middle income', 'High income', 'Lower middle income', 
					 'European Union', 'International', 'Low income') -- filter out locations with these rows (non continents rows)
GROUP BY 1
ORDER BY 2 DESC;


---------------------------------------------------------------------------------------------------------------------
-- Continents with Highest Death Count per Population
SELECT location, population, SUM(new_deaths) AS total_death_count, 
		SUM(new_deaths/population)*100 AS death_population_percentage
FROM deaths
WHERE continent IS NULL -- Query for continents only
AND location NOT IN ('World', 'Upper middle income', 'High income', 'Lower middle income', 
					 'European Union', 'International', 'Low income') -- filter out locations with these rows (non continents rows)
GROUP BY 1,2
ORDER BY 3 DESC NULLS LAST; --setting NULLS LAST because NULL is larger than non-NULL values.


---------------------------------------------------------------------------------------------------------------------
-- Global Numbers --

-- Global Deaths Percentage of all Time.
SELECT SUM(new_deaths) AS total_deaths, SUM(new_cases) AS total_cases,
		SUM(new_deaths)/SUM(new_cases)*100 AS global_deaths_percentage
FROM deaths
WHERE continent IS NULL -- Query for continents only
AND location NOT IN ('World', 'Upper middle income', 'High income', 'Lower middle income', 'European Union', 
					   'International', 'Low income') -- filter out locations with these rows (non continents rows)
ORDER BY 3;


---------------------------------------------------------------------------------------------------------------------
-- Global Deaths Percentage by Date.
SELECT date, SUM(total_deaths) AS total_deaths, SUM(total_cases) AS total_cases, 
		SUM(total_deaths)/SUM(total_cases)*100 AS global_deaths_percentage
FROM deaths
WHERE continent IS NULL -- Query for continents only
AND location NOT IN ('World', 'Upper middle income', 'High income', 'Lower middle income', 
					 'European Union', 'International', 'Low income') -- filter out locations with these rows (non continents rows)
GROUP BY 1
ORDER BY 4 DESC NULLS LAST;  --setting NULLS LAST because NULL is larger than non-NULL values.


----------------------------------------------------------------------------------------------------------------------
-- All columns from Covid_Vaccinations Table.

SELECT * 
FROM vaccinations
WHERE continent IS NOT NULL -- filters out the continents in the location column.
ORDER BY 4,5;

