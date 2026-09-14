-- Bucketing every transaction into a profit tier
WITH profit_calc AS
(
  SELECT *,
("Unit_Price"*"Quantity_Sold"*(1-"Discount"))-("Unit_Cost"*"Quantity_Sold") AS Profit
FROM sales
)
SELECT *,
CASE 
WHEN profit < 1000 THEN 'LOW'
WHEN profit BETWEEN 1000 AND 4000 THEN 'MEDIUM'
when Profit > 4000 THEN 'HIGH'
END AS Profit_TIER
FROM profit_calc;
