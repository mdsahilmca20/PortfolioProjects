/************************************************************************************************************/
/******************************** Consumer Good Ad-hoc Requests *********************************************/
-- Done by: Md Sahil
-- Date: 11/02/2023
/************************************************************************************************************/

/* Use Database */
USE `gdb041`;

-- -----------------------------------------------------------------------------------------------------------
/* 1. Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.*/

select distinct market
from dim_customer 
where customer = "Atliq Exclusive" and region = "APAC" 
order by market;

/* Explaination : 
This SQL query retrieves the market name from the "dim_customer" table
where the customer name is "Atliq Exclusive" and the region is "APAC". 
The results are then ordered in  ascending order based on the market.
*/


-- -----------------------------------------------------------------------------------------------------------
/* 2. What is the percentage of unique product increase in 2021 vs. 2020? 
	The final output contains these fields,
		unique_products_2020
		unique_products_2021
		percentage_chg
*/

with unique_products as
(
	select count(distinct case when fiscal_year = 2020 then product_code end) as unique_products_2020,/* count of unique products sold in 2020 */
		   count(distinct case when fiscal_year = 2021 then product_code end) as unique_products_2021 /* count of unique products sold in 2021 */
	from fact_sales_monthly 
)
select unique_products_2020,
	   unique_products_2021,
	   concat(round(((unique_products_2021-unique_products_2020)/unique_products_2020)*100,2),'%') as percentage_chg
from unique_products;

/* Explaination : 
This SQL query uses "WITH" clause to create a temporary table unique_products
to store the count of unique products for the years 2020 and 2021 from fact_sales_monthly table. 
Then we retreive the number of unique products sold in 2020 and 2021 and calculates the percentage
change between the two years from unique_products table. */


-- -----------------------------------------------------------------------------------------------------------
/* 3. Provide a report with all the unique product counts for each segment and
sort them in descending order of product counts. The final output contains 2 fields,
segment
product_count
*/

select segment,
	   count(distinct(product_code)) as product_count
from dim_product
group by segment
order by product_count desc;

/* Explaination : 
This SQL query retrieves the segment and the count of unique  product codes from the "dim_product" table. 
The query groups the results by segment and
retreives the counts of distinct product codes for each segment, 
ordered in descending order based on the product count
*/ 


-- -----------------------------------------------------------------------------------------------------------
/* 4. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? 
The final output contains these fields,
segment
product_count_2020
product_count_2021
difference
*/
with unique_products as
(
	select segment,
		   count(distinct case when fiscal_year = 2020 then sm.product_code end) as product_count_2020,/* count of unique products sold in 2020 */
		   count(distinct case when fiscal_year = 2021 then sm.product_code end) as product_count_2021 /* count of unique products sold in 2021 */
	from fact_sales_monthly as sm
    inner join dim_product as p
    where sm.product_code = p.product_code
    group by segment
)
select segment,
	   product_count_2020,
	   product_count_2021,
	   (product_count_2021-product_count_2020) as difference
from unique_products
order by difference desc;

/* Explaination : 
This SQL query uses "WITH" clause to create a temporary table unique_products
to store the segment from dim_product table and 
the count of unique products for the years 2020 and 2021 from fact_sales_monthly table respectively. 
Then we retreive the segments, the number of unique products sold in 2020 and 2021 and differences in
change between the two years from unique_products table.
 */
 
 
 -- -----------------------------------------------------------------------------------------------------------
 /* 5. Get the products that have the highest and lowest manufacturing costs.
The final output should contain these fields,
product_code
product
manufacturing_cost
*/
select p.product_code as product_code,
	   p.product as product,
       sm.manufacturing_cost as manufacturing_cost
from dim_product as p
inner join fact_manufacturing_cost as sm
on p.product_code = sm.product_code
where sm.manufacturing_cost = (select max(manufacturing_cost) from fact_manufacturing_cost)
      or
      sm.manufacturing_cost = (select min(manufacturing_cost) from fact_manufacturing_cost)
order by sm.manufacturing_cost desc;

/* Explaination:
This SQL query join dim_product and fact_manufacturing_cost table by inner join method 
to retreive all the information required in the given request
and then to get the product with highest and lowest manufacturing cost,
filtering manufacture cost by maximum and minimum manufacturing cost.
*/
 
 
 -- -----------------------------------------------------------------------------------------------------------
 /* 6. Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. 
The final output contains these fields,
customer_code
customer
average_discount_percentage
*/
with top_customer as (
	select c.customer_code as customer_code,
	       c.customer as customer,
           concat(round(avg(pre_invoice_discount_pct)*100, 2), '%') as average_discount_percentage,
           dense_rank() over( order by avg(pre_invoice_discount_pct) desc) as `dense_rank`
	from dim_customer as c
    inner join fact_pre_invoice_deductions as pid
    on c.customer_code = pid.customer_code
    where market = 'India'
    and
    fiscal_year = 2021
    group by customer,customer_code
)
select customer_code,
	   customer,
       average_discount_percentage
from top_customer
where `dense_rank`<=5;

/* Explaination : 
This SQL query uses "WITH" clause to create a temporary table top_customer
to store the customer_code, customer from dim_customer table and 
calculate average high pre_invoice_discount_pct 
and dense rank by average pre_invoice_discount_pct value in descending order 
from fact_pre_invoice_deductions table 
for the fiscal year 2021 and in the Indian market by filtering fields.
Then we retreive the tp 5 customer_code, the customer and the average discount percentage 
from top_customer table using dense rank.
 */


-- -----------------------------------------------------------------------------------------------------------
/* 7. Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount 
*/
select monthname(sm.date) as `Month`,
	   year(sm.date) as`Year`,
       concat('$',round(sum(sold_quantity * gross_price)/100000,2), ' M') as `Gross sales Amount`
from fact_sales_monthly as sm
inner join fact_gross_price as gp
on sm.product_code = gp.product_code 
   and
   sm.fiscal_year = gp.fiscal_year
inner join dim_customer as c
on c.customer_code = sm.customer_code
where c.customer = 'Atliq Exclusive'
group by `month`, `year`
order by `year`;

/* Explaination:
This SQL query join dim_customer, fact_sales_monthly, and fact_gross_price table by inner join method 
to retreive all the information required in the given request
and then to get the product with highest and lowest manufacturing cost,
filtering manufacture cost by maximum and minimum manufacturing cost.
*/


-- -----------------------------------------------------------------------------------------------------------
/* 8. In which quarter of 2020, got the maximum total_sold_quantity? 
The final output contains these fields sorted by the total_sold_quantity,
Quarter
total_sold_quantity
*/

-- view-1(all quarter of 2020)
select case
			when month(date) in (9,10,11) then 'Q1'
			when month(date) in (12,1,2) then 'Q2'
			when month(date) in (3,4,5) then 'Q3'
			else 'Q4'
			end as `Quarter`,
			sum(sold_quantity) as total_sold_quantity
from fact_sales_monthly
where fiscal_year = 2020
group by `Quarter`
order by total_sold_quantity desc;

-- view-2(only maximum total sold quarter of 2020)
with max_sold_quantity as(
	select case
				when month(date) in (9,10,11) then 'Q1'
				when month(date) in (12,1,2) then 'Q2'
				when month(date) in (3,4,5) then 'Q3'
				else 'Q4'
				end as `Quarter`,
			sum(sold_quantity) as total_sold_quantity,
			dense_rank() over( order by sum(sold_quantity) desc) as `dense_rank`
	from fact_sales_monthly
    where fiscal_year = 2020
    group by `Quarter`
)
select `Quarter`,
		total_sold_quantity
from max_sold_quantity
where `dense_rank` = 1;

/* Explaination : 
This SQL query uses "WITH" clause to create a temporary table max_sold_quantity
to store the Quarter, total_sold_quantity by calculating  
from  fact_sales_monthly table columns date and sold_quantity and 
also store dense rank by total sold quantity in descending order for the fiscal year 2020.
Then we retreive Quarter with maximum total sold quantity  
from max_sold_quantity table using dense rank.
 */
 
 
 -- ----------------------------------------------------------------------------------------------------------
 /* 9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? 
The final output contains these fields,
channel
gross_sales_mln
percentage
*/
with gross_sales as
( 
	select c.channel AS `channel`,
           sum(gp.gross_price * sm.sold_quantity) as gross_sales
	from fact_sales_monthly as sm
	left join fact_gross_price as gp
	on sm.product_code = gp.product_code
	and 
    sm.fiscal_year = gp.fiscal_year
	left join dim_customer as c
	on sm.customer_code = c.customer_code
	where sm.fiscal_year = 2021
	group by c.channel
)
select `channel`,
        concat('$',round(gross_sales/1000000,2),' M') as gross_sales_mln, -- converting values to millions
		concat(round(gross_sales/ sum(gross_sales) over()*100,2),'%') AS percentage
from gross_sales
order by percentage desc;

/* Explaination : 
This SQL query uses "WITH" clause to create a temporary table gross_sales
to store the channel from dim_customer table and 
calculate gross salary from fact_sales_monthly table and fact_gross_price table
columns gross_price and sold_quantity respectively 
and joining 3 tables by left join method starting from fact_sales_monthly
for the fiscal year 2021.
Then we retreive channel, gross sales in millions and the the percentage of contribution 
from gross_sales table.
 */


-- ----------------------------------------------------------------------------------------------------------
/* 10. Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? 
The final output contains these fields,
division
product_code
product
total_sold_quantity
rank_order
*/
with top_sold_product as(
	select p.division,
		   p.product_code,
           p.product,
           sum(sm.sold_quantity) as total_sold_quantity,
           dense_rank() over(partition by p.division order by sum(sm.sold_quantity) desc) as rank_order
	from dim_product as p
    inner join fact_sales_monthly sm
    ON p.product_code = sm.product_code
    where sm.fiscal_year = 2021
    group by p.division, p.product_code, p.product
 )
SELECT *
FROM top_sold_product
WHERE rank_order <= 3;

/* Explaination : 
This SQL query uses "WITH" clause to create a temporary table top_sold_product
to store the division, product_code, product from dim_product table and 
total_sold_quantity by calculating  from  fact_sales_monthly table column sold_quantity, 
and also store dense rank by total sold quantity in descending order 
partition by division column of dim_product table for the fiscal year 2021.
Then we retreive top 3 details of each division  
from top_sold_product table using dense rank.
 */