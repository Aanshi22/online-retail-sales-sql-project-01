# online-retail-sales-sql-project-01
SQL project for designing and analyzing an Online Retail Sales database using MySQL — includes ERD, queries, views, triggers, and insights.

# Online Retail Sales SQL Project

A complete SQL project for an online retail platform — built with **MySQL**, including ER modeling, data insertion, advanced queries, views, triggers, and analytics reports.

---

## Project Structure

| File / Folder                                 | Description |
|-----------------------------------------------|-------------|
| `ecommer_db.sql`                              | Full database schema and structure |
| `Insert_tables_in_ecommer_db.sql`             | Sample data: 25 customers, 20 products, 40+ orders |
| `Sales Report Queries_01.sql`                 | Core sales queries (revenue, top customers/products) |
| `Customer Insights & Order Status Reports_02.sql` | Customer-level and order status insights |
| `Advanced Queries – JOINs, Window Functions & Views_03.sql` | Complex queries using `JOIN`, `RANK()`, `ROW_NUMBER()`, etc. |
| `views_and_triggers.sql`                      | Views for reporting and trigger to auto-update stock |
| `.csv` files                                  | Sample outputs from key queries (for analysis/reporting) |
| `ER_e-commerce_db.mwb`                        | MySQL Workbench ERD model |
| `ER_e-commerce_db.png`                        | PNG version of ER diagram |
| `README.md`                                   | Project overview (this file) |
| `LICENSE`                                     | Open source license file |

---

## Tools Used

- **MySQL 8**
- **MySQL Workbench** (ERD modeling)
- **DBeaver** / MySQL CLI (for SQL execution)
- **Git & GitHub**

---

## Features

-  Fully normalized schema (3NF) with 5 main tables
-  Realistic data: 25 customers, 20 products, 40+ orders, payments
-  Reporting queries for:
  - Revenue, product sales, top customers
  - Category-wise analytics
  - Order and payment status
-  Views and triggers implemented:
  - Auto stock deduction via trigger
  - Views for customer spend and top-selling products
-  Output CSVs for insights / demo

---

##  Key SQL Concepts Demonstrated

- `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING`
- `RANK()`, `DENSE_RANK()`, `ROW_NUMBER()` — window functions
- `CREATE VIEW`, `AFTER INSERT TRIGGER`
- `INDEX`, `FOREIGN KEY`, `DEFAULT`, `NOT NULL` constraints

---

##  Use Cases

- Academic project / DBMS lab submission  
- Interview-ready SQL project  
- Portfolio piece for backend or data roles  

---

## Author

> **Anshi Bajaj**  
>  Contact: anshibajaj22@gmail.com
