--Transactions Above the average sale value
SELECT * FROM sales 
WHERE ("Unit_Price"*"Quantity_Sold") >
(SELECT AVG("Unit_Price"*"Quantity_Sold") from sales);
