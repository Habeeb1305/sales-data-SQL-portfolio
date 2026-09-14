# Sales Analytics SQL Portfolio

SQL queries written against a 1,000-row e-commerce sales dataset, covering joins, subqueries, CTEs, CASE logic, window functions, and aggregate filtering. Each query answers a specific business question, and each is documented with the reasoning behind the calculation choices made.
This project pairs with a companion Power BI dashboard built on the same dataset - see `Dashboard.pdf` for a full export of the dashboard.


## A note on data consistency

Early in this project, I found that the dataset's `Sales_Amount` column didn't reconcile with `Unit_Price × Quantity_Sold` — the two differed by roughly 12x in aggregate. Rather than use an unverified column, every revenue and profit calculation across this project (SQL and Power BI) consistently derives value from `Unit_Price`, `Unit_Cost`, `Quantity_Sold`, and `Discount` instead.

## Queries

### 1. Revenue vs. Target by Region (`01_join_region_targets.sql`)
**Question:** Which regions are hitting their revenue target, and which are missing it?
**Technique:** INNER JOIN against a `Region_Targets` lookup table, with GROUP BY to aggregate actual revenue per region.

### 2. Above-Average Transactions (`02_subquery_above_average.sql`)
**Question:** Which individual transactions are above the average sale value across all transactions?
**Technique:** Correlated subquery — the outer query filters rows by comparing each transaction's value against a single aggregate value calculated in the inner query.

### 3. Above-Average Transactions by Region, via CTE (`03_cte_above_average_by_region.sql`)
**Question:** Same as above, rewritten using a CTE, then extended to count how many above-average transactions exist per region.
**Technique:** `WITH` clause — demonstrates the readability/reusability advantage of CTEs over nested subqueries, and cross-checked against Query 2's row count for verification (both return 401 matching rows).

### 4. Profit Tier Classification (`04_case_profit_tiers.sql`)
**Question:** How does each transaction's profit break down into High/Medium/Low tiers?
**Technique:** CTE + CASE statement. Profit is calculated per row as `(Unit_Price × Quantity_Sold × (1 − Discount)) − (Unit_Cost × Quantity_Sold)`, then bucketed.

### 5. Sales Rep Ranking by Region (`05_window_rank_by_region.sql`)
**Question:** Who is the top-performing sales rep within each region, by total revenue?
**Technique:** `RANK() OVER (PARTITION BY Region ORDER BY Revenue DESC)` — ranking resets independently within each region rather than ranking globally.

### 6. High-Discount Product Categories (`06_having_discount_threshold.sql`)
**Question:** Which product categories have given out more than £2.5M in total discounts?
**Technique:** GROUP BY + HAVING — filtering on an aggregated (summed) value, which WHERE cannot do since WHERE filters rows before aggregation occurs.

## Tools
PostgreSQL (via Supabase), built alongside a matching Power BI / DAX dashboard on the same dataset.
