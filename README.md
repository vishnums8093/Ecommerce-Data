# E-Commerce Data Analysis: Sales Performance & Profitability

## 📌 Overview

**End-to-end data analysis of an e-commerce dataset using Google BigQuery (SQL) for data cleaning & analysis, and Tableau Public for interactive visualization.**

---

### 📦 Data Source
The analysis utilizes an Online Retail Sales Dataset sourced from Kaggle (fully cited in the report), covering transactional data from April 2018 through March 2019. The dataset contains records for sales, product details, customer information, and geographic locations.

### 🛠️ Tools & Technologies
* **Database & Querying:** **Google BigQuery** (for robust cloud-based data warehousing and processing) and **SQL** (for data manipulation and analysis).
* **Visualization:** **Tableau Public** (for creating interactive, shareable dashboards).

### 🎯 Business Questions
* What is the overall sales trend over time?
* How are we performing against sales targets?
* Which product categories & sub-categories drive the most profit?
* Who are our most valuable customers?
* What is the geographic distribution of sales?

### 📐 Key Metrics Analyzed
The analysis focuses on **Sales**, **Profit**, comparison against **Sales Targets**, and **Customer Profitability**.

### 📊 Key Insights
📈 Growth & Volatility: Sales show strong growth, peaking at ₹61.4K in Jan 2019, but the trend is highly volatile (e.g., a 63% jump into January, followed by a 38% drop).
🎯 Target Misses: Targets are consistently missed overall due to underperformance in Clothing and Furniture; Electronics is the only consistently high performer.
💰 Profit Drivers: Printers and Bookcases drove the largest total profits, while Tables and Electronic Games were confirmed as loss-making categories.
👥 Top Customer: Seema emerged as the most valuable customer, generating nearly ₹2,000 in total profit.
🌍 Geographic Strategy: Pune and Indore are the most profitable cities, while Chennai and Ahmedabad are loss-making markets requiring urgent intervention.

---

## 🚀 How to Use

To explore this project and replicate the analysis:

* **SQL Queries:** Check the **`sql/`** directory for all BigQuery scripts used for data cleaning, transformation, and final analysis.
* **Full Case Study:** View the complete documentation and deep dive into the findings in the **`report/Ecommerce_Analysis.pdf`** file.
* **Visualizations:** See the key screenshots from the final Tableau Public dashboard in the **`report/dashboard_screenshots/`** folder.

---

## 📂 Repository Structure

The repository is organized to separate the analytical code from the documentation:

| Folder/File | Purpose |
| :--- | :--- |
| `sql/` | Contains all BigQuery **SQL scripts** for data cleaning, transformation, feature engineering, and final analysis queries. |
| `report/` | Contains the **full case study PDF** and the dashboard screenshot folder. |
| `report/dashboard_screenshots/` | Contains **screenshots** of the final Tableau Studio dashboard. |
| `README.md` | This file: The project overview, methodology, and key findings. |

---

## ➡️ Project Steps & Workflow

This project followed a standard data analysis pipeline:

1.  **Data Ingestion:** The raw e-commerce data was loaded into a dedicated dataset in **Google BigQuery**.
2.  **Data Cleaning & Transformation:** SQL scripts were used to handle missing values, correct data types, and normalize product/customer names.
3.  **Data Analysis:** Final analytical SQL queries were executed to answer the business questions, generating optimized views for visualization.
4.  **Data Visualization:** **Tableau Public** was then used to connect to these local CSV files to build the interactive sales and profitability dashboard, ensuring the visualization was based on the finalized, clean data.
---
