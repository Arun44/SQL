Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT(city)
FROM station 
WHERE city RLIKE '^[^aeiou]' AND city RLIKE '[^aeiou]$'