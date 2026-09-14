-- Which Regions are hitting there revenue target
SELECT s."Region", SUM("Unit_Price"*"Quantity_Sold") as Actual_Revenue , "Target_Revenue" FROM Sales s
INNER JOIN "Region_Targets" rt
ON s."Region"= rt."Region"
GROUP by s."Region", rt."Target_Revenue"
ORDER BY  Actual_Revenue;