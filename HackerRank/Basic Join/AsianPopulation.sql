Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT SUM(c.population)
FROM city c INNER JOIN country cc ON c.countrycode=cc.code
WHERE cc.continent='asia'
