--- SQL Query for Tableau Visualization. ---

-------------------------------------------------------------------------------------------
-- Visualization 1 --

-- Looking at Global Total Cases vs Total Deaths
SELECT SUM(new_deaths) AS total_deaths, SUM(new_cases) AS total_cases, 
		SUM(new_deaths)/SUM(new_cases)*100 AS death_percentage
FROM deaths
WHERE continent IS NOT NULL -- filters out the continents in the location column.
ORDER BY 1,2;


-------------------------------------------------------------------------------------------
-- Visualization 2 --

-- Continents with Highest Death Count
SELECT location, SUM(new_deaths) AS total_death_count
FROM deaths
WHERE continent IS NULL -- Query for continents only
AND location NOT IN ('World', 'Upper middle income', 'High income', 'Lower middle income', 
					 'European Union', 'International', 'Low income') -- filter out locations with these rows (non continents rows)
GROUP BY 1
ORDER BY 2 DESC;


-------------------------------------------------------------------------------------------
-- Visualization 3 --

-- Countries with Highest Infection Rate compared to Popoulation 
SELECT location, population, SUM(new_cases) AS infection_count,
		SUM(new_cases/population)*100 AS infected_population_percentage
FROM deaths
WHERE continent IS NOT NULL -- filters out the continents in the location column.
GROUP BY 1,2
ORDER BY 4 DESC NULLS LAST; --setting NULLS LAST because NULL is larger than non-NULL values.


-------------------------------------------------------------------------------------------
-- Visualization 4 --

-- Countries with Highest Infection Rate compared to Popoulation by Date. 
SELECT location, population, date, SUM(new_cases) AS infection_count,
		SUM(new_cases/population)*100 AS infected_population_percentage
FROM deaths
WHERE continent IS NOT NULL -- filters out the continents in the location column.
GROUP BY 1,2,3 
ORDER BY 4 DESC NULLS LAST; --setting NULLS LAST because NULL is larger than non-NULL values.