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

 How to Run the Queries
Clone the repository:

bash
Copy
Edit
git clone https://github.com/your-username/retail-sales-analysis.git
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
