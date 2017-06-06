Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns. Do not include continents without cities in your output.

SELECT p.continent,FLOOR(AVG(t.population))
FROM city t LEFT JOIN country p ON t.countrycode=p.code
WHERE p.continent IS NOT NULL
GROUP BY p.continent