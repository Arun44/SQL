

Question 1:Given Table	A (first table	to be entered in the query) and Table	B (second table to be entered in the	query)The query result	shown below is	a result of what kind	of join?

   Right Join	


Question 2: On what day was Dillard’s income based on total sum of purchases the greatest?

  04/12/18
  
SELECT	TOP 10 saledate,SUM(amt) AS tot_sales
FROM	trnsact
WHERE stype='P'
GROUP	BY saledate
ORDER	BY tot_sales DESC


Question 3: What is the deptdesc of the departments that have the top 3 greatest numbers of skus from the skuinfo table associated with them?

 INVEST,POLOMEN,BRIOSO

SELECT	TOP 3 s.dept,d.deptdesc,COUNT(DISTINCT s.sku)	AS numskus
FROM	skuinfo	s JOIN	deptinfo d
ON	s.dept=d.dept
GROUP	BY s.dept, d.deptdesc
ORDER	BY numskus DESC

Question 4:Which table contains the most distinct sku numbers?

 skuinfo


Question 5:How many skus are in the skstinfo table, but NOT in the skuinfo table?

 0

SELECT	COUNT(DISTINCT	st.sku)
FROM	skstinfo st LEFT JOIN	skuinfo	si
ON	st.sku=si.sku
WHERE	si.sku IS NULL

Question 6: What is the average amount of profit Dillard’s made per day?

 $1,527,903 

SELECT	SUM(amt-(cost*quantity))/COUNT(DISTINCT saledate) AS	avg_sales
FROM	trnsact	t JOIN	skstinfo si
ON	t.sku=si.sku AND t.store=si.store
WHERE	stype='P';

Question 7:how many MSAs are there within the state of North Carolina (abbreviated “NC”),and within these MSAs, what is the lowest population level (msa_pop) and highest income level (msa_income)?

 16 MSAs,lowest	population of 339,511,highest income level of $36,151

SELECT	COUNT(store),MIN(msa_pop),MAX(msa_income)
FROM	store_msa
WHERE	state='NC'

Question 8:What department (with department description), brand, style, and color brought in the greatest total amount of sales?

 Department 800	 described as Clinique,brand Clinique,style 6142,color DDML

SELECT	TOP 20	d.deptdesc,s.dept,s.brand,s.style,s.color,SUM(t.AMT)	AS tot_sales
FROM	trnsact	t,skuinfo s,deptinfo d
WHERE	t.sku=s.sku AND	 s.dept=d.dept AND t.stype='P'
GROUP	BY d.deptdesc,	s.dept,	s.brand,s.style,s.color
ORDER	BY tot_sales DESC

Question 9:How many stores have more than 180,000 distinct skus associated with them in the skstinfo table?

  12

SELECT	COUNT(DISTINCT	sku) AS	numskus
FROM	skstinfo
GROUP	BY store
HAVING	numskus	>180000;

Question 10:Look at the data from all the distinct skus in the “cop” department with a “federal” brand
and a “rinse wash” color. You'll see that these skus have the same values in some of the columns,
meaning that they have some features in common.In which columns do these skus have different values from one another, meaning that their features differ in the categories represented by the columns? Choose all that apply. Note that you will need more than a single correct selection to answer the question correctly. 

   style
   size

Question 11:How many skus are in the skuinfo table, but NOT in the skstinfo table?

 803,966

SELECT	COUNT(DISTINCT	si.sku)
FROM	skstinfo st RIGHT JOIN	skuinfo	si
ON	st.sku=si.sku
WHERE	st.sku	IS NULL;


Question 12:In what city and state is the store that had the greatest total sum of sales?

  Metairie, LA

SELECT	TOP 10	t.store,s.city,	s.state,SUM(amt) AS tot_sales
FROM	trnsact	t JOIN	strinfo	s
ON	t.store=s.store
WHERE stype='P'
GROUP	BY t.store,s.state,s.city
ORDER	BY tot_sales DESC


Question 13:Given Table A (first table to be entered	in the query) and Table B (second table to be entered in	the query)the query result shown below is a result of what kind of join?

  Left	Join


Question 14:How many states have more than 10 Dillards stores in them?

  15

SELECT	COUNT(*) AS numstores
FROM	strinfo
GROUP	BY state
HAVING	numstores>10

Question 15:What is the suggested retail price of all the skus in the “reebok” department with the “skechers” brand and a “wht/saphire” color?

 $29.00

SELECT	DISTINCT s.sku,	s.dept,	s.color,d.deptdesc,st.retail
FROM	skuinfo	s JOIN	deptinfo d
ON	s.dept=	d.dept	JOIN skstinfo st
ON	s.sku=st.sku
WHERE	d.deptdesc='reebok' AND s.brand='skechers' AND s.color='wht/saphire’;