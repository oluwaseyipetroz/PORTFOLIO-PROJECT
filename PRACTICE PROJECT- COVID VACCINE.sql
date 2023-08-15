--SELECT *
--FROM PortfolioProject.dbo.coviddeaths
--ORDER BY 3,4

--SELECT *
--FROM PortfolioProject.dbo.covidvacination
--ORDER BY 3,4

-- TOTAL CASES VS TOTAL DEATH
-- LIKELIHOOD OF DEATH FROM INFECTION

--SELECT location, date, total_cases, total_deaths,(total_deaths / total_cases)*100 as deathpercentage
--FROM PortfolioProject..coviddeaths
--ORDER BY 1,2

-- TOTAL CASES VS POPULATION


--SELECT location, date, population, total_cases,(total_cases / population)*100 as deathpercentage
--FROM PortfolioProject..coviddeaths
--ORDER BY 1,2

--Countries with highest infection rate

--SELECT location, population, max(total_cases) as Highestcoviddeath,(max(total_cases / population))*100 as populationinfectionrate
--FROM PortfolioProject..coviddeaths
--GROUP BY location, population
--ORDER BY populationinfectionrate DESC

-- TOTAL DEATH VS POPULATION
-- RATE OF DEATH PER POPULATION SIZE

--SELECT location, population, MAX(total_deaths) as deathcount
--FROM PortfolioProject..coviddeaths
--WHERE continent IS NOT NULL
--GROUP BY location, population
--ORDER BY deathcount DESC

--SELECT location, SUM(new_cases) as total_cases, SUM( new_deaths) as total_deaths, (SUM(new_deaths) / SUM(new_cases)) * 100 as death_percentage
--FROM PortfolioProject..coviddeaths
--WHERE continent IS NULL
--GROUP BY location
--ORDER BY 1,2

-- CONTINENT VS LIFE EXPECTANCY

--SELECT DISTINCT D.continent, D.population, V.life_expectancy
--FROM PortfolioProject..coviddeaths D
--JOIN PortfolioProject..covidvacination v
--ON D.location = V.location
--and d.date = V.date
--WHERE D.continent IS NOT NULL
--ORDER BY 1

--COVID DEATH CADIOVASUCALR DEATH RATE

--SELECT D.location,D.continent, D.date, SUM(total_deaths) AS TD, SUM(cardiovasc_death_rate) as VD
--FROM PortfolioProject..coviddeaths D
--JOIN PortfolioProject..covidvacination v
--ON D.location = V.location
--and d.date = V.date
--WHERE D.continent IS NOT NULL
--GROUP BY D.location,D.continent, D.date
--ORDER BY 1 

--TEMP TABLE

--CREATE TABLE Percentageofpopulationvaccinated
--(
--continent VARCHAR(255),
--location VARCHAR(255),
--date datetime,
--population numeric,
--rollingpeoplevaccinated numeric
--)
--INSERT INTO Percentageofpopulationvaccinated
--SELECT D.location,D.continent, D.date, SUM(total_deaths) AS TD, SUM(cardiovasc_death_rate) as VD
--FROM PortfolioProject..coviddeaths D
--JOIN PortfolioProject..covidvacination v
--ON D.location = V.location
--and d.date = V.date
--WHERE D.continent IS NOT NULL
--GROUP BY D.location,D.continent, D.date
--ORDER BY 1 


--CREATING VIEW FOR VISUALIZATION

DROP VIEW IF EXISTS infectionrate
CREATE VIEW infectionrate AS
SELECT location, population, max(total_cases) as Highestcoviddeath,(max(total_cases / population))*100 as populationinfectionrate
FROM PortfolioProject..coviddeaths
GROUP BY location, population
--ORDER BY populationinfectionrate DESC

--DROP VIEW infectionrate

SELECT *
FROM infectionrate