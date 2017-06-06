Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT t.name
FROM city t INNER JOIN country r ON t.countrycode=r.code
WHERE r.continent='africa'