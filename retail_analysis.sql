#ratil_sales details 

SELECT * FROM retail.retail;

# iam directly import the csv file 

use retail;

show tables;

select * from retail;

select count(distinct customer_id) from retail;

#small alter the column name 

alter table retail change column `ï»¿transactions_id` `transaction_id` INT;

#data clening 

SELECT * FROM retail
WHERE transaction_id IS NULL;
  
SELECT * FROM retail
WHERE sale_date IS NULL;

SELECT * FROM retail
WHERE sale_time IS NULL;

SELECT * FROM retail
WHERE customer_id IS NULL;

SELECT * FROM retail
WHERE gender IS NULL
or age IS NULL
or category is null
or quantiy is null
or price_per_unit is null
or cogs is null 
or total_sale is null;  #there is no null values


#10 important queries
#1. Total revenue & number of transactions
#2. Average order value (AOV)
#3. Sales by category
#4.Customer purchase frequency
#5.Find out who has purchased the most in each category
#6.mothly revenue
#7. Age group spending
#8. Profit analysis by category
#9.weekdays vs weekend days
#10.Find customers whose total spending is above the overall average spending



#1. Total revenue & number of transactions

select  transaction_id as number_of_transactions 
,sum(total_sale-cogs) as total_revenue
 from retail group by transaction_id ;
 
 #2. Average order value (AOV)
 
 select 
 round(sum(total_sale) / count(transaction_id),2) as
 Average_order_value
 from retail;
 
 #3. Sales by category
 
 select category ,sum(total_sale) as total_revenue from retail group by category 
 order by total_revenue desc; 
 
 #4.Customer purchase frequency
 select customer_id, count(*) as purchace from retail
 group by customer_id
 order by purchace ;
 
 #5.Find out who has purchased the most in each category
 
 select customer_id,category ,count(*)
 from retail where customer_id=1
 group by category ;
 
 #6.mothly revenue
 
 select date_format(sale_date,'%y-%m') as month,
 sum(total_sale)as revenue from retail group by month
 order by month asc;
 
 #select sum(total_sale) from retail where date_format(sale_date,'%y-%m-%d') between '22-01-01'  and '22-01-30';
 #select date_format( sale_date,'%y-%m-%d') as date from retail order by date asc ;
 
 #6. Gender-based total spend
select gender, 
sum(case when sale_date between '2022-01-01'  and '2022-12-31' then total_sale else 0 end) as '2022',
sum(case when sale_date between '2023-01-01' and '2023-12-31' then total_sale else 0 end) as '2023'
from retail 
group by gender;

#7. Age group spending

select 
(case when age <20 then 'teens' 
    when age between 20 and 29 then '20s'
    when age between 30 and 39 then '30s'
    when age between 40 and 49 then '40s'
    else '50+'
end)as age_grouping,
sum(total_sale) as total_revenue
from retail 
group by age_grouping
order by total_revenue desc;

#8. Profit analysis by category

select category,sum(total_sale-cogs) as profit 
from retail 
group by category
order by profit desc;

#9.weekdays vs weekend days

select 
(case when DAYOFMONTH(sale_date) in (1,7) then 'weekend'
else 'weekdays'
end) as days,
sum(total_sale) as total_revenue from retail
                               #where gender='female' or 'male' your wish       
 group by days;

#10.Find customers whose total spending is above the overall average spending

select customer_id,sum(total_sale)as spent from retail
group by customer_id 
having spent >(select avg(total_sale) from retail)
order by spent desc;


 
