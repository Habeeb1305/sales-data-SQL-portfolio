--Ranking sales rep by total revenue in each region 
WITH revenue_calc AS 
(
  SELECT "Sales_Rep","Region", SUM("Unit_Price"*"Quantity_Sold") as Revenue FROM sales
  Group BY "Sales_Rep","Region"
)
SELECT "Sales_Rep", "Region", Revenue,
RANK() OVER(partition by "Region" ORDER BY revenue DESC) FROM revenue_calc;