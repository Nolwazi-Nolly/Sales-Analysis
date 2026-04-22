SELECT * FROM [Sales B];

SELECT *,
((current_avg_price-previous_year_avg_price)/previous_year_avg_price *100 )AS price_change,
 ((CAST(current_quantity_sold-previous_quantity_sold AS FLOAT)/previous_quantity_sold)*100) volume_change
FROM (
SELECT YEAR(Date) year,
       AVG(Daily_Price_per_unit) current_avg_price,
       SUM(Quantity_Sold) current_quantity_sold,
       LAG(SUM(Quantity_Sold)) OVER (ORDER BY YEAR(Date)) previous_quantity_sold,
       LAG(AVG(Daily_Price_per_unit)) over (ORDER BY YEAR(Date)) previous_year_avg_price 
       FROM [Sales B]
        WHERE YEAR(Date)>=2014
       GROUP BY YEAR(Date)
       )t

SELECT *,
ROUND(((avg_price_per_unit-previous_month_avg_price)/previous_month_avg_price)*100,2) price_change,
(CAST(current_quantity_sold-previous_month_quanty_sold AS FLOAT)/previous_month_quanty_sold)*100  quantity_change
FROM(
SELECT YEAR(Date) year,
       DATENAME(month, Date) AS month_name,
       month(Date) month,
       SUM(Quantity_Sold) current_quantity_sold,
       LAG(SUM(Quantity_Sold)) OVER (ORDER BY YEAR(Date),month( Date)) previous_month_quanty_sold,
       avg(daily_price_per_unit) avg_price_per_unit,
       LAG(avg(daily_price_per_unit)) OVER (ORDER BY YEAR(Date),month( Date)) previous_month_avg_price
       FROM [Sales B]
       WHERE YEAR(Date)>=2014
       GROUP BY YEAR(Date), month(Date),DATENAME(month, Date)
     
       SELECT *,
(ROUND(total_sales/total_quantity ,2)) avg_unit_price
FROM(
SELECT YEAR(Date) year,
         MONTH(Date) AS month_number
       DATENAME(Month,Date) month,
       SUM(sales) total_sales,
       SUM(Quantity_sold) total_quantity
       FROM [dbo].[Sales B]
       WHERE YEAR(Date) >= 2014
       GROUP BY YEAR(Date), MONTH(Date), DATENAME(Month,Date) month
       )t  ORDER BY year, month_number, month


       SELECT * FROM [dbo].[Sales D];
SELECT *,
(Avg_daily_gross_profit- previous_avg_gross_profit) year_over_year
FROM (
SELECT YEAR(Date) year,
      AVG (Daily_gross_profit) Avg_daily_gross_profit,
      LAG(AVG (Daily_gross_profit)) OVER (ORDER BY YEAR(Date)) previous_avg_gross_profit
      FROM [dbo].[Sales D]
      WHERE  YEAR(Date) >=2014
      GROUP BY YEAR(Date) 
      )t 
SELECT YEAR(Date) year,
       AVG(Daily_price_per_unit) Avg_Price_Per_Unit,
       AVG(Cost_per_unit) Avg_Cost_Per_Unit
       FROM [dbo].[Sales D]
       GROUP BY YEAR(Date)
       ORDER BY YEAR(Date) 

SELECT YEAR(Date) year ,
       month(Date) month,
       DATENAME(MONTH, Date) month_name,
       AVG(daily_gross_profit) Avg_GP_Percent,
       AVG(Daily_price_per_unit) AS Avg_Price_Per_Unit,
       AVG(Cost_per_unit) AS Avg_Cost_Per_Unit,
        SUM(Quantity_Sold) AS Total_Quantity
        FROM [dbo].[Sales D]
        WHERE YEAR(Date) >= 2014
        GROUP BY YEAR(Date), MONTH(Date), DATENAME(MONTH, Date)
      
       
