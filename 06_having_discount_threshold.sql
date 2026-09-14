-- Which Product categories have given more than 2,500,000 in total discount 
SELECT "Product_Category", SUM("Discount"*"Unit_Price"*"Quantity_Sold") AS Total_discount FROM sales
GROUP BY "Product_Category"
having SUM("Discount"*"Unit_Price"*"Quantity_Sold") > 2500000;