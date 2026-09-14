-- Count of transactions above the average based on region 
WITH region_average AS 
( 
SELECT sales."Region" FROM sales
WHERE ("Unit_Price"*"Quantity_Sold") > 
(SELECT AVG("Unit_Price"*"Quantity_Sold") FROM sales)
)
SELECT "Region", COUNT(*)
FROM region_average
GROUP BY "Region";
