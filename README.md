# 🛒 Retail Sales Data Analysis (SQL)

## 📌 Project Overview
This project analyzes retail sales data to uncover business insights such as revenue trends, customer purchasing behavior, and profitability by category.  
Using **MySQL**, I performed data cleaning, transformation, and created 10+ analysis queries for better decision-making.

---

## 📂 Dataset Details
- **Table Name:** `retail`
- **Source:** Imported from CSV file
- **Columns:**
  - `transaction_id` — Unique transaction number
  - `sale_date` — Date of the sale
  - `sale_time` — Time of the sale
  - `customer_id` — Unique customer identifier
  - `gender` — Customer gender
  - `age` — Customer age
  - `category` — Product category
  - `quantity` — Number of units sold
  - `price_per_unit` — Price per product
  - `cogs` — Cost of goods sold
  - `total_sale` — Total transaction value

---

## 🛠 SQL Workflow

### 1. **Data Import**
- CSV file loaded directly into MySQL using `LOAD DATA` or MySQL Workbench import.

### 2. **Data Cleaning**
- Renamed columns (e.g., `ï»¿transactions_id` → `transaction_id`)
- Checked for `NULL` values in critical columns
- Verified data types for accuracy

### 3. **Analysis Queries**
Key business questions answered:

1. **Total revenue & number of transactions**
2. **Average order value (AOV)**
3. **Sales by category**
4. **Customer purchase frequency**
5. **Top buyer in each category**
6. **Monthly revenue trends**
7. **Gender-based sales (year-wise)**
8. **Age group spending**
9. **Profit analysis by category**
10. **Weekdays vs weekends revenue**
11. **High-value customers (above average spending)**

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


 ##How to Run the Queries
Clone the repository:

bash
Copy
Edit
git clone (https://github.com/sukin2004/sql_retail_analysis-/edit/main/README.md)
cd retail-sales-analysis
Import the CSV file into MySQL.

Open and run queries.sql in MySQL Workbench or CLI.

View results and insights in your SQL output.

📄 Files in Repository
retail.csv — Dataset

queries.sql — All SQL queries (cleaning + analysis)

README.md — Project documentation

📬 Contact
If you have any questions or suggestions, feel free to connect!
📧 Email: sukin3563@gmail.com
💼 LinkedIn: https://www.linkedin.com/in/sukin-j-a237662a3/
