Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
Not A Triangle: The given values of A, B, and C don't form a triangle.
Equilateral: It's a triangle with 3 sides of equal length.
Isosceles: It's a triangle with 2 sides of equal length.
Scalene: It's a triangle with 3 sides of differing lengths.

select 
if( (A+B+C <= 2*greatest(A,B,C)),"Not A Triangle",
if(A=B and B=C,"Equilateral",
if(A=B or B=C or C=A,"Isosceles","Scalene")))
from Triangles;